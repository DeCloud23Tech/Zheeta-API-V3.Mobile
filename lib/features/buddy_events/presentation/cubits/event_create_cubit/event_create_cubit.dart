import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/buddy_events/data/models/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/requests/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/create_event_usecase.dart';

part 'event_create_state.dart';

@prod
@LazySingleton()
class EventCreateCubit extends Cubit<EventCreateState> {
  final CreateBuddyEvent createBuddyEvent;

  EventCreateCubit({
    required this.createBuddyEvent,
  }) : super(EventCreateInitial());

  final Map<String, dynamic> _eventData = {};

  Future<void> createEventData({
    required String category,
    required String eventType,
    required String eventTitle,
    required String description,
    required List<String> selectedTags,
    String? participationFee,
    int? buddiesWanted,
    List<File>? selectedMedia,
    required String dateTime,
    required int duration,
    required String eventAddress,
    required String country,
    required String city,
    required String state,
    required List<String> guidelines,
    required List<String> itemsToBring,
    required String? targetCountry,
    required String? gender,
    required String? maritalStatus,
    required String? occupation,
    required bool isChecked,
  }) async {
    _eventData.addAll({
      'category': category,
      'eventType': eventType,
      'eventTitle': eventTitle,
      'description': description,
      'selectedTags': selectedTags,
      'participationFee': participationFee,
      'buddiesWanted': buddiesWanted,
      'selectedMedia': selectedMedia ?? [],
      'dateTime': dateTime,
      'duration': duration,
      'eventAddress': eventAddress,
      'country': country,
      'city': city,
      'state': state,
      'guidelines': guidelines,
      'itemsToBring': itemsToBring,
      'targetCountry': targetCountry,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'occupation': occupation,
      'isChecked': isChecked,
    });

    emit(EventCreateUpdated(_eventData));
    print(_eventData);

    final userId = await TokenUtil.getUserId();

    final data = CreateBuddyEventRequest(
      creatorId: userId!,
      category: _eventData['category'] ?? '',
      title: _eventData['eventTitle'] ?? '',
      description: _eventData['description'] ?? '',
      noOfBuddiesWanted: _eventData['buddiesWanted'] ?? 0,
      startDate:
          DateTime.parse(_eventData['dateTime'] ?? DateTime.now().toString()),
      durationOrLengthInHrs: _eventData['duration'] ?? 0,
      eventMainPhoto:
          (_eventData['selectedMedia'] as List<File>?)?.isNotEmpty == true
              ? (_eventData['selectedMedia'] as List<File>).first.path
              : '',
      eventOtherPhotos: (_eventData['selectedMedia'] as List<File>?)
          ?.skip(1) // Skip the first media
          .take(2) // Take only the next two media
          .map((file) => file.path)
          .toList(),
      eventLocationAddress: _eventData['eventAddress'] ?? '',
      eventCity: _eventData['city'] ?? '',
      eventState: _eventData['state'] ?? '',
      eventCountry: _eventData['country'] ?? '',
      buddyEventType: _eventData['eventType'] == 'Free' ? 1 : 2,
      tagList: _eventData['selectedTags'] as List<String>?,
      eventFee: double.tryParse(_eventData['participationFee'] ?? '0') ?? 0.0,
      isPromoted: isChecked,
      eventItems: _eventData['itemsToBring'] as List<String>?,
      eventGuidelines: _eventData['guidelines'] as List<String>?,
      gender: _eventData['gender'] ?? '',
      targetCountry: _eventData['targetCountry'] ?? '',
      maritalStatus: _eventData['maritalStatus'] ?? '',
      occupation: _eventData['occupation'] ?? '',
    );

    createEventCubit(data);
  }

  Future<void> createEventCubit(CreateBuddyEventRequest request) async {
    emit(EventCreateLoading());
    final result = await createBuddyEvent(request);

    result.fold(
      (failure) => emit(EventCreateFailure(errorMessage: failure.message)),
      (eventData) => emit(EventCreateSuccess(eventData: eventData)),
    );
  }
}
