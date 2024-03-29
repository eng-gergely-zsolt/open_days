package com.sapientia.open.days.backend.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sapientia.open.days.backend.SpringApplicationContext;
import com.sapientia.open.days.backend.service.UserService;
import com.sapientia.open.days.backend.ui.model.request.user.LoginUserRequest;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	private final AuthenticationManager authenticationManager;

	// The authentication manager will authenticate the user.
	public AuthenticationFilter(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}

	/*
	 * Spring framework is used to authenticate a user. This method will be triggered.
	 * A user payload will be converted into credentials object containing username and password.
	 */
	@Override
	public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) throws AuthenticationException {
		try {
			LoginUserRequest credentials = new ObjectMapper().readValue(req.getInputStream(), LoginUserRequest.class);

			return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					credentials.getUsername(), credentials.getPassword(), new ArrayList<>()));

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/*
	 * If the username and password are correct then this method will be called. Otherwise, this will not be called.
	 * Once the token is generated, it will be included into the header. The client have to extract this web token,
	 * and he has to store it (for example, in the mobile app). The user has to include the token as a header into
	 * the request to be able to communicate with the secure endpoints.
	 * We add the user id to the header.
	 */
	@Override
	protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain, Authentication auth) {
		String username = ((UserPrincipal) auth.getPrincipal()).getUsername();
		UserService userService = (UserService) SpringApplicationContext.getBean("userServiceImpl");

		String token = Jwts.builder()
				.setSubject(username)
				.setExpiration(new Date(System.currentTimeMillis() + SecurityConstants.EXPIRATION_TIME))
				.signWith(SignatureAlgorithm.HS512, SecurityConstants.getJwtSecretKey())
				.compact();

		res.addHeader("User-Public-ID", userService.getUserByUsername(username));
		res.addHeader(SecurityConstants.HEADER_STRING, SecurityConstants.TOKEN_PREFIX + token);
	}
}
