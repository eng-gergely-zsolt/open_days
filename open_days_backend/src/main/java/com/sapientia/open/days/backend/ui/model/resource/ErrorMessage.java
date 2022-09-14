package com.sapientia.open.days.backend.ui.model.resource;

public enum ErrorMessage {
    MISSING_REQUIRED_FIELD("Missing required field. Please check documentation for required fields"),
    NO_RECORD_FOUND("Record with provided id is not found"),

    EMAIL_ALREADY_REGISTERED("Email address already registered"),

    INSTITUTION_NOT_EXISTS("Institution does not exist"),
    MISSING_LAST_NAME("Missing last name"),
    MISSING_FIRST_NAME("Missing first name"),
    MISSING_EMAIL("Missing email"),
    MISSING_PASSWORD("Missing password"),
    MISSING_INSTITUTION("Missing institution"),
    MISSING_USERNAME("Missing username"),
    INVALID_PUBLIC_ID("Invalid public id");

    private String errorMessage;

    ErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
