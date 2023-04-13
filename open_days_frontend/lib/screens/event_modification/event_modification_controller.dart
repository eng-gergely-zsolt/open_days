import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/activity_model.dart';
import '../../models/base_response_model.dart';
import '../../repositories/base_repository.dart';
import '../../models/activities_response_model.dart';
import '../../models/event_modification_request.dart';
import '../../repositories/event_modification_repository.dart';

class EventModificationController {
  String? _location;
  String? _meetingLink;
  Reference? _imageToUploadRef;
  BaseResponseModel? _updateEventResponse;
  StateProvider<bool>? _isOnlineMeetingProvider;
  StateProvider<DateTime>? _selectedDateTimeProvider;

  FutureProvider<ActivitiesResponseModel>? _activitiesProvider;

  var _imageUrl = '';
  var _imagePathInDB = '';

  final ProviderRef _ref;
  final BaseRepository _baseRepository;
  final EventModificationRepository _eventModificationRepository;

  final _folderNameInStorage = 'event';
  final _imagePathProvider = StateProvider<String>((ref) => "");
  final _isLoadingProvider = StateProvider<bool>((ref) => false);
  final _selectedActivityProvider = StateProvider<String?>(((ref) => null));

  EventModificationController(this._ref, this._baseRepository, this._eventModificationRepository);

  String? getLink() {
    return _meetingLink;
  }

  String getImageUrl() {
    return _imageUrl;
  }

  String? getLocation() {
    return _location;
  }

  StateProvider<bool> getIsLoadinProvider() {
    return _isLoadingProvider;
  }

  StateProvider<String> getImagePathProvider() {
    return _imagePathProvider;
  }

  BaseResponseModel? getUpdateEventResponse() {
    return _updateEventResponse;
  }

  StateProvider<bool?>? getIsOnlineMeetingProvider() {
    return _isOnlineMeetingProvider;
  }

  void setLink(String meetingLink) {
    _meetingLink = meetingLink;
  }

  void setLocation(String location) {
    _location = location;
  }

  void deleteUpdateEventResponse() {
    _updateEventResponse = null;
  }

  String getFormattedTime(DateTime dateTime) {
    final DateFormat dateFormatter = DateFormat('HH:mm');
    return dateFormatter.format(dateTime);
  }

  StateProvider<String?> getSelectedActivityProvider() {
    return _selectedActivityProvider;
  }

  void setIsOnlineMeetingProvider(bool? isOnlineMeeting) {
    if (isOnlineMeeting == null) return;
    _ref.read(_isOnlineMeetingProvider!.notifier).state = isOnlineMeeting;
  }

  List<String> getAllActivityName(List<ActivityModel> activities) {
    List<String> activityNames = [];

    for (ActivityModel it in activities) {
      activityNames.add(it.name);
    }

    return activityNames;
  }

  StateProvider<DateTime> getSelectedDateTimeProvider(String? dateTimeString) {
    if (dateTimeString != null && _selectedDateTimeProvider == null) {
      DateTime dateTime;
      try {
        dateTime = DateTime.parse(dateTimeString);
        _selectedDateTimeProvider = StateProvider<DateTime>(((ref) => dateTime));
      } on Exception {
        _selectedDateTimeProvider = StateProvider<DateTime>(((ref) => DateTime.now()));
      }
    }

    return _selectedDateTimeProvider as StateProvider<DateTime>;
  }

  Future<bool> invalidateControllerProvider() {
    _ref.invalidate(eventModificationControllerProvider);
    return Future.value(true);
  }

  /// Creates the initial data that is required to draw the UI first time.
  FutureProvider<ActivitiesResponseModel> createInitialDataProvider(String? imagePath) {
    return _activitiesProvider ??= FutureProvider((ref) async {
      var response = ActivitiesResponseModel();

      if (imagePath != null) {
        _imageUrl = await _getDownloadURL(imagePath);
      }

      response = await _baseRepository.getAllActivityRepo();

      return response;
    });
  }

  /// Gets the URL link from the connected Firebase Storage by the given path.
  Future<String> _getDownloadURL(String imagePath) async {
    String response;
    var imageRef = FirebaseStorage.instance.ref().child(imagePath);

    try {
      response = await imageRef.getDownloadURL();
    } catch (_) {
      imageRef = FirebaseStorage.instance.ref().child('event/placeholder.jpg');
      response = await imageRef.getDownloadURL();
    }

    return response;
  }

  void initializeMeetingProvider(bool? isOnlineMeeting) {
    if (isOnlineMeeting != null && _isOnlineMeetingProvider == null) {
      _isOnlineMeetingProvider = StateProvider<bool>(((ref) => isOnlineMeeting));
    } else if (isOnlineMeeting == null && _isOnlineMeetingProvider == null) {
      _isOnlineMeetingProvider = StateProvider<bool>(((ref) => false));
    }
  }

  void setSelectedDate(DateTime? date) {
    if (date == null) return;

    final currentDateTime = _ref.read(_selectedDateTimeProvider!);

    final newSelectedDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      currentDateTime.hour,
      currentDateTime.minute,
    );

    _ref.read(_selectedDateTimeProvider!.notifier).state = newSelectedDateTime;
  }

  void setSelectedTime(TimeOfDay? time) {
    if (time == null) return;

    final currentDateTime = _ref.read(_selectedDateTimeProvider!);

    final newSelectedDateTime = DateTime(
      currentDateTime.year,
      currentDateTime.month,
      currentDateTime.day,
      time.hour,
      time.minute,
    );

    _ref.read(_selectedDateTimeProvider!.notifier).state = newSelectedDateTime;
  }

  void saveChanges(int? eventId, String? selectedActivityName) async {
    _ref.read(_isLoadingProvider.notifier).state = true;

    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd H:m');
    EventModificationRequest updateEventPayload = EventModificationRequest();

    updateEventPayload.location = _location;
    updateEventPayload.activityName = selectedActivityName;
    updateEventPayload.isOnline = _ref.read(_isOnlineMeetingProvider!);
    updateEventPayload.dateTime =
        dateFormatter.format(_ref.read(_selectedDateTimeProvider as StateProvider<DateTime>));

    if (updateEventPayload.isOnline == false) {
      updateEventPayload.meetingLink = null;
    } else {
      updateEventPayload.meetingLink = _meetingLink;
    }

    if (_imageToUploadRef != null) {
      try {
        await _imageToUploadRef?.putFile(File(_ref.read(_imagePathProvider)));
        updateEventPayload.imagePath = _imagePathInDB;
      } catch (error) {}
    }

    if (eventId == null) {
      _updateEventResponse = BaseResponseModel();
    } else {
      _updateEventResponse =
          await _eventModificationRepository.updateEventRepo(eventId, updateEventPayload);
    }

    _ref.read(_isLoadingProvider.notifier).state = false;
  }

  void selectImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      _ref.read(_imagePathProvider.notifier).state = xFile.path;
    }

    if (xFile != null) {
      final imageExtension = path.extension(xFile.path);
      final uniqueImageName = DateTime.now().millisecondsSinceEpoch.toString() + imageExtension;

      _imagePathInDB = _folderNameInStorage + '/' + uniqueImageName;

      Reference rootRef = FirebaseStorage.instance.ref();
      Reference eventDirectoryRef = rootRef.child(_folderNameInStorage);
      _imageToUploadRef = eventDirectoryRef.child(uniqueImageName);
    }
  }
}

final eventModificationControllerProvider = Provider((ref) {
  final _baseRepository = ref.watch(baseRepositoryProvider);
  final _eventModificationRepository = ref.watch(eventModificationRepositoryProvider);
  return EventModificationController(ref, _baseRepository, _eventModificationRepository);
});
