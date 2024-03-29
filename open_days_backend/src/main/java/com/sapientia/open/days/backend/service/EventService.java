package com.sapientia.open.days.backend.service;

import com.sapientia.open.days.backend.ui.model.request.UpdateEventRequest;
import com.sapientia.open.days.backend.ui.model.Event;
import com.sapientia.open.days.backend.ui.model.User;
import com.sapientia.open.days.backend.ui.model.response.ParticipatedUsersStatResponse;

import java.util.List;

public interface EventService {
	// Get
	List<Event> getFutureEvents();

	List<User> getEnrolledUsers(long eventId);

	List<User> getParticipatedUsers(long eventId);

	List<Event> getEventsConformToUserRole(String userPublicId);

	List<ParticipatedUsersStatResponse> getParticipatedUserStat (List<String> activityNames);

	boolean isUserEnrolled(long eventId, String userPublicId);

	// Post
	void createEvent(Event payload);

	void enrollUser(long eventId, String userPublicId);

	void saveUserParticipation(long eventId, String userPublicId);

	// Put
	void updateEvent(long eventId, UpdateEventRequest updateEventPayload);

	// Delete
	void deleteEvent(long eventId);

	void unenrollUser(long eventId, String userPublicId);


}
