package com.sapientia.open.days.backend.service.impl;

import com.sapientia.open.days.backend.exceptions.BaseException;
import com.sapientia.open.days.backend.exceptions.GeneralServiceException;
import com.sapientia.open.days.backend.io.entity.InstitutionEntity;
import com.sapientia.open.days.backend.io.entity.PasswordResetTokenEntity;
import com.sapientia.open.days.backend.io.entity.RoleEntity;
import com.sapientia.open.days.backend.io.entity.UserEntity;
import com.sapientia.open.days.backend.io.repository.InstitutionRepository;
import com.sapientia.open.days.backend.io.repository.PasswordResetTokenRepository;
import com.sapientia.open.days.backend.io.repository.RoleRepository;
import com.sapientia.open.days.backend.io.repository.UserRepository;
import com.sapientia.open.days.backend.security.UserPrincipal;
import com.sapientia.open.days.backend.service.UserService;
import com.sapientia.open.days.backend.shared.EmailService;
import com.sapientia.open.days.backend.shared.Utils;
import com.sapientia.open.days.backend.shared.dto.UserDTO;
import com.sapientia.open.days.backend.ui.model.request.VerifyEmailByOtpCodeReq;
import com.sapientia.open.days.backend.ui.model.resource.ErrorCode;
import com.sapientia.open.days.backend.ui.model.resource.ErrorMessage;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import static com.sapientia.open.days.backend.shared.Roles.*;

@Service
@SuppressWarnings("unused")
public class UserServiceImpl implements UserService {

	@Autowired
	Utils utils;

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	InstitutionRepository institutionRepository;

	@Autowired
	PasswordResetTokenRepository passwordResetTokenRepository;

	@Autowired
	EmailService emailService;

	@Override
	public UserDTO getUserByUsername(String username) {
		UserEntity userEntity = userRepository.findByUsername(username);

		if (userEntity == null) {
			throw new GeneralServiceException(ErrorCode.USER_NOT_FOUND_WITH_USERNAME.getErrorCode(),
					ErrorMessage.USER_NOT_FOUND_WITH_USERNAME.getErrorMessage());
		}

		UserDTO result = new UserDTO();
		BeanUtils.copyProperties(userEntity, result);

		return result;
	}

	@Override
	public UserDTO getUserByPublicId(String publicId) {
		List<String> userRoles = new ArrayList<>();
		UserEntity userEntity = userRepository.findByPublicId(publicId);

		if (userEntity == null) {
			throw new GeneralServiceException(ErrorCode.USER_NOT_FOUND_WITH_ID.getErrorCode(),
					ErrorMessage.USER_NOT_FOUND_WITH_ID.getErrorMessage());
		}

		UserDTO result = new UserDTO();
		BeanUtils.copyProperties(userEntity, result);

		for (RoleEntity userRole : userEntity.getRoles()) {
			userRoles.add(userRole.getName());
		}

		if (userRoles.contains(ROLE_ADMIN.name())) {
			result.setRoleName(ROLE_ADMIN.name());
		} else if (userRoles.contains(ROLE_ORGANIZER.name())) {
			result.setRoleName(ROLE_ORGANIZER.name());
		} else {
			result.setRoleName(ROLE_USER.name());
		}

		return result;
	}

	@Override
	public List<UserDTO> getUsers(int pageNumber, int recordPerPage) {

		List<UserDTO> result = new ArrayList<>();

		if (pageNumber < 0) pageNumber = 1;
		if (pageNumber > 0) pageNumber -= 1;

		Pageable pageableRequest = PageRequest.of(pageNumber, recordPerPage);

		Page<UserEntity> userPage = userRepository.findAll(pageableRequest);
		List<UserEntity> users = userPage.getContent();

		for (UserEntity user : users) {
			UserDTO userDTO = new UserDTO();
			BeanUtils.copyProperties(user, userDTO);
			result.add(userDTO);
		}

		return result;
	}

	@Override
	public void createUser(UserDTO user) {
		InstitutionEntity institution = institutionRepository.findByName(user.getInstitution());

		if (institution == null) {
			throw new GeneralServiceException(ErrorCode.INSTITUTION_NOT_EXISTS.getErrorCode(),
					ErrorMessage.INSTITUTION_NOT_EXISTS.getErrorMessage());
		}

		if (userRepository.findByEmail(user.getEmail()) != null) {
			throw new GeneralServiceException(ErrorCode.EMAIL_ALREADY_REGISTERED.getErrorCode(),
					ErrorMessage.EMAIL_ALREADY_REGISTERED.getErrorMessage());
		}

		UserEntity userEntity = new UserEntity();
		BeanUtils.copyProperties(user, userEntity);

		String publicId = utils.generatePublicId(15);

		HashSet<RoleEntity> roleEntities = new HashSet<>();

		for (String role : user.getRoles()) {
			RoleEntity roleEntity = roleRepository.findByName(role);
			if (roleEntity != null) {
				roleEntities.add(roleEntity);
			}
		}

		userEntity.setPublicId(publicId);
		userEntity.setRoles(roleEntities);
		userEntity.setInstitution(institution);
		userEntity.setEmailVerificationStatus(false);
		userEntity.setEncryptedPassword(bCryptPasswordEncoder.encode(user.getPassword()));

		int otpCode = Utils.generateSixDigitNumber();
		userEntity.setOtpCode(otpCode);

		try {
			new EmailService().sendOtpCodeViaEmail(user.getEmail(), otpCode);
			UserEntity storedUserDetails = userRepository.save(userEntity);
		} catch (Exception e) {
			throw new BaseException(ErrorCode.REGISTRATION_EMAIL_NOT_SENT.getErrorCode(),
					ErrorMessage.REGISTRATION_EMAIL_NOT_SENT.getErrorMessage());
		}
	}

	@Override
	public UserDTO updateUser(UserDTO user, String publicId) {
		UserEntity userEntity = userRepository.findByPublicId(publicId);

		if (userEntity == null) {
			throw new GeneralServiceException(ErrorCode.USER_NOT_FOUND_WITH_ID.getErrorCode(),
					ErrorMessage.USER_NOT_FOUND_WITH_ID.getErrorMessage());
		}

		if (user.getLastName().length() >= 3 && user.getLastName().length() <= 50) {
			userEntity.setLastName(user.getLastName());
		}

		if (user.getFirstName().length() >= 3 && user.getFirstName().length() <= 50) {
			userEntity.setFirstName(user.getFirstName());
		}

		UserEntity updatedUserDetails = userRepository.save(userEntity);

		UserDTO result = new UserDTO();
		BeanUtils.copyProperties(updatedUserDetails, result);

		return result;
	}

	@Override
	public void deleteUser(String publicId) {

		UserEntity userEntity = userRepository.findByPublicId(publicId);

		if (userEntity == null) {
			throw new GeneralServiceException(ErrorCode.USER_NOT_FOUND_WITH_ID.getErrorCode(),
					ErrorMessage.USER_NOT_FOUND_WITH_ID.getErrorMessage());
		}

		userRepository.delete(userEntity);
	}

	/**
	 * Authenticates the email by the code that was sent to the user via email.
	 */
	@Override
	public void verifyEmailByOtpCode(VerifyEmailByOtpCodeReq payload) {
		UserEntity user = userRepository.findByEmail(payload.getEmail());

		if (user == null) {
			throw new BaseException(ErrorCode.EMAIL_VERIFICATION_INVALID_EMAIL.getErrorCode(),
					ErrorMessage.EMAIL_VERIFICATION_INVALID_EMAIL.getErrorMessage());
		}

		if (user.getEmailVerificationStatus()) {
			throw new BaseException(ErrorCode.EMAIL_VERIFICATION_EMAIL_ALREADY_VERIFIED.getErrorCode(),
					ErrorMessage.EMAIL_VERIFICATION_EMAIL_ALREADY_VERIFIED.getErrorMessage());
		}

		if (user.getOtpCode() != payload.getOtpCode()) {
			throw new BaseException(ErrorCode.EMAIL_VERIFICATION_INVALID_OTP_CODE.getErrorCode(),
					ErrorMessage.EMAIL_VERIFICATION_INVALID_OTP_CODE.getErrorMessage());
		}

		user.setOtpCode(null);
		user.setEmailVerificationStatus(true);

		try {
			userRepository.save(user);
		} catch (Exception error) {
			throw new BaseException(ErrorCode.UNSPECIFIED_ERROR.getErrorCode(), error.getMessage());
		}
	}

	@Override
	public boolean requestPasswordReset(String emailAddress) {

		UserEntity userEntity = userRepository.findByEmail(emailAddress);

		if (userEntity == null) {
			return false;
		}

		String token = new Utils().generatePasswordResetToken(userEntity.getPublicId());

		PasswordResetTokenEntity passwordResetTokenEntity = new PasswordResetTokenEntity();
		passwordResetTokenEntity.setToken(token);
		passwordResetTokenEntity.setUserDetails(userEntity);
		passwordResetTokenRepository.save(passwordResetTokenEntity);

		return new EmailService().sendPasswordResetRequest(
				userEntity.getFirstName(),
				userEntity.getEmail(),
				token);
	}

	@Override
	public boolean resetPassword(String token, String password) {

		boolean returnValue = false;
		PasswordResetTokenEntity passwordResetTokenEntity = passwordResetTokenRepository.findByToken(token);

		if (Utils.hasTokenExpired(token) || passwordResetTokenEntity == null) {
			return false;
		}

		// Prepare new password
		String encodedPassword = bCryptPasswordEncoder.encode(password);

		// Update User password in database
		UserEntity userEntity = passwordResetTokenEntity.getUserDetails();
		userEntity.setEncryptedPassword(encodedPassword);
		UserEntity savedUserEntity = userRepository.save(userEntity);

		// Verify if password was saved successfully
		if (savedUserEntity.getEncryptedPassword().equalsIgnoreCase(encodedPassword)) {
			returnValue = true;
		}

		// Remove Password Reset token from database;
		passwordResetTokenRepository.delete(passwordResetTokenEntity);

		return returnValue;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findByUsername(username);

		if (userEntity == null)
			throw new UsernameNotFoundException(username);

		return new UserPrincipal(userEntity);
	}
}
