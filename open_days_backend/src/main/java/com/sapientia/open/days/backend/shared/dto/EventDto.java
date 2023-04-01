package com.sapientia.open.days.backend.shared.dto;

import java.io.Serial;
import java.io.Serializable;

@SuppressWarnings("unused")
public class EventDto implements Serializable {

	private long id;
	private boolean isOnline;
	private String location;
	private String dateTime;
	private String imageLink;
	private String description;
	private String meetingLink;
	private String organizerId;
	private String activityName;
	private String organizerLastName;
	private String organizerFirstName;

	@Serial
	private static final long serialVersionUID = 3667708176484458123L;

	public long getId() {
		return id;
	}

	public boolean getIsOnline() {
		return isOnline;
	}

	public String getLocation() {
		return location;
	}

	public String getDateTime() {
		return dateTime;
	}

	public String getImageLink() {
		return imageLink;
	}

	public String getDescription() {
		return description;
	}

	public String getMeetingLink() {
		return meetingLink;
	}

	public String getOrganizerId() {
		return organizerId;
	}

	public String getActivityName() {
		return activityName;
	}

	public String getOrganizerLastName() {
		return organizerLastName;
	}

	public String getOrganizerFirstName() {
		return organizerFirstName;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setIsOnline(boolean isOnline) {
		this.isOnline = isOnline;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setMeetingLink(String meetingLink) {
		this.meetingLink = meetingLink;
	}

	public void setOrganizerId(String organizerId) {
		this.organizerId = organizerId;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public void setOrganizerLastName(String organizerLastName) {
		this.organizerLastName = organizerLastName;
	}

	public void setOrganizerFirstName(String organizerFirstName) {
		this.organizerFirstName = organizerFirstName;
	}
}
