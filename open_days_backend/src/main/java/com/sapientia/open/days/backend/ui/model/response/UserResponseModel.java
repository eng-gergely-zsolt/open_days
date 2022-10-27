package com.sapientia.open.days.backend.ui.model.response;

@SuppressWarnings("unused")
public class UserResponseModel {
    private String email;
    private String publicId;
    private String username;
    private String lastName;
    private String roleName;
    private String firstName;

    public String getEmail() {
        return email;
    }

    public String getPublicId() {
        return publicId;
    }

    public String getUsername() {
        return username;
    }

    public String getLastName() {
        return lastName;
    }

    public String getRoleName() {
        return roleName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPublicId(String publicId) {
        this.publicId = publicId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
}
