package com.sapientia.open.days.backend.exceptions;

import com.sapientia.open.days.backend.ui.model.resource.ErrorCode;
import com.sapientia.open.days.backend.ui.model.BaseError;
import com.sapientia.open.days.backend.ui.model.ErrorMessage;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
@SuppressWarnings("unused")
public class ApplicationExceptionHandler {

	/**
	 * It creates the response model if a BaseException is thrown.
	 */
	@ExceptionHandler(value = {BaseException.class})
	public ResponseEntity<Object> handleBaseException(BaseException exception, WebRequest request) {
		BaseError response = new BaseError(exception.getErrorCode(), exception.getMessage());
		return new ResponseEntity<>(response, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	/*
	 * A custom error message.
	 * This method is responsible for only one GeneralServiceException exception.
	 */
	@ExceptionHandler(value = {GeneralServiceException.class})
	public ResponseEntity<Object> handleUserServiceException(GeneralServiceException exception, WebRequest request) {

		ErrorMessage errorMessages = new ErrorMessage(exception.getErrorCode(), exception.getMessage());

		return new ResponseEntity<>(errorMessages, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// This method handles all the other, non-specified exceptions.
	@ExceptionHandler(value = {Exception.class})
	public ResponseEntity<Object> handleOtherException(Exception exception, WebRequest request) {

		ErrorMessage errorMessages = new ErrorMessage(ErrorCode.UNSPECIFIED_ERROR.getErrorCode(),
				exception.getMessage());

		return new ResponseEntity<>(errorMessages, new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
