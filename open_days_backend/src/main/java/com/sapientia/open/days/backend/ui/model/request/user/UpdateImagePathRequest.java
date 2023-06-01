package com.sapientia.open.days.backend.ui.model.request.user;

@SuppressWarnings("unused")
public class UpdateImagePathRequest {
	private String imagePath;

	public UpdateImagePathRequest() {}

	public UpdateImagePathRequest(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
}
