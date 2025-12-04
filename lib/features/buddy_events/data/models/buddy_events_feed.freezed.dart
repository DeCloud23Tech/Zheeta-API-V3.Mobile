// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_events_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEvent {
  String get id;
  String? get creatorId;
  String? get creatorUsername;
  String? get creatorProfilePhotoUrl;
  String? get category;
  String? get title;
  String? get description;
  int? get noOfBuddiesWanted;
  int? get noOfBuddiesJoined;
  String? get shareLink;
  DateTime? get startDate;
  int? get durationOrLengthInHrs;
  DateTime? get endDate;
  String? get eventLocationAddress;
  String? get eventCity;
  String? get eventState;
  String? get eventCountry;
  String? get eventMainPhotoUrl;
  List<String>? get eventOtherPhotosUrl;
  List<String>? get tagList;
  bool? get isPromoted;
  bool? get isOpen;
  bool? get isActive;
  List<String>? get eventItems;
  List<String>? get eventGuidelines;
  String? get gender;
  String? get targetCountry;
  String? get maritalStatus;
  String? get occupation;
  double? get eventFee;
  int? get buddyEventType;

  /// Create a copy of BuddyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventCopyWith<BuddyEvent> get copyWith =>
      _$BuddyEventCopyWithImpl<BuddyEvent>(this as BuddyEvent, _$identity);

  /// Serializes this BuddyEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorUsername, creatorUsername) ||
                other.creatorUsername == creatorUsername) &&
            (identical(other.creatorProfilePhotoUrl, creatorProfilePhotoUrl) ||
                other.creatorProfilePhotoUrl == creatorProfilePhotoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.noOfBuddiesWanted, noOfBuddiesWanted) ||
                other.noOfBuddiesWanted == noOfBuddiesWanted) &&
            (identical(other.noOfBuddiesJoined, noOfBuddiesJoined) ||
                other.noOfBuddiesJoined == noOfBuddiesJoined) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.durationOrLengthInHrs, durationOrLengthInHrs) ||
                other.durationOrLengthInHrs == durationOrLengthInHrs) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.eventLocationAddress, eventLocationAddress) ||
                other.eventLocationAddress == eventLocationAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.eventCountry, eventCountry) ||
                other.eventCountry == eventCountry) &&
            (identical(other.eventMainPhotoUrl, eventMainPhotoUrl) ||
                other.eventMainPhotoUrl == eventMainPhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other.eventOtherPhotosUrl, eventOtherPhotosUrl) &&
            const DeepCollectionEquality().equals(other.tagList, tagList) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other.eventItems, eventItems) &&
            const DeepCollectionEquality()
                .equals(other.eventGuidelines, eventGuidelines) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.targetCountry, targetCountry) ||
                other.targetCountry == targetCountry) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.eventFee, eventFee) ||
                other.eventFee == eventFee) &&
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        creatorId,
        creatorUsername,
        creatorProfilePhotoUrl,
        category,
        title,
        description,
        noOfBuddiesWanted,
        noOfBuddiesJoined,
        shareLink,
        startDate,
        durationOrLengthInHrs,
        endDate,
        eventLocationAddress,
        eventCity,
        eventState,
        eventCountry,
        eventMainPhotoUrl,
        const DeepCollectionEquality().hash(eventOtherPhotosUrl),
        const DeepCollectionEquality().hash(tagList),
        isPromoted,
        isOpen,
        isActive,
        const DeepCollectionEquality().hash(eventItems),
        const DeepCollectionEquality().hash(eventGuidelines),
        gender,
        targetCountry,
        maritalStatus,
        occupation,
        eventFee,
        buddyEventType
      ]);

  @override
  String toString() {
    return 'BuddyEvent(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl, tagList: $tagList, isPromoted: $isPromoted, isOpen: $isOpen, isActive: $isActive, eventItems: $eventItems, eventGuidelines: $eventGuidelines, gender: $gender, targetCountry: $targetCountry, maritalStatus: $maritalStatus, occupation: $occupation, eventFee: $eventFee, buddyEventType: $buddyEventType)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventCopyWith<$Res> {
  factory $BuddyEventCopyWith(
          BuddyEvent value, $Res Function(BuddyEvent) _then) =
      _$BuddyEventCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? creatorId,
      String? creatorUsername,
      String? creatorProfilePhotoUrl,
      String? category,
      String? title,
      String? description,
      int? noOfBuddiesWanted,
      int? noOfBuddiesJoined,
      String? shareLink,
      DateTime? startDate,
      int? durationOrLengthInHrs,
      DateTime? endDate,
      String? eventLocationAddress,
      String? eventCity,
      String? eventState,
      String? eventCountry,
      String? eventMainPhotoUrl,
      List<String>? eventOtherPhotosUrl,
      List<String>? tagList,
      bool? isPromoted,
      bool? isOpen,
      bool? isActive,
      List<String>? eventItems,
      List<String>? eventGuidelines,
      String? gender,
      String? targetCountry,
      String? maritalStatus,
      String? occupation,
      double? eventFee,
      int? buddyEventType});
}

/// @nodoc
class _$BuddyEventCopyWithImpl<$Res> implements $BuddyEventCopyWith<$Res> {
  _$BuddyEventCopyWithImpl(this._self, this._then);

  final BuddyEvent _self;
  final $Res Function(BuddyEvent) _then;

  /// Create a copy of BuddyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = freezed,
    Object? creatorUsername = freezed,
    Object? creatorProfilePhotoUrl = freezed,
    Object? category = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? noOfBuddiesWanted = freezed,
    Object? noOfBuddiesJoined = freezed,
    Object? shareLink = freezed,
    Object? startDate = freezed,
    Object? durationOrLengthInHrs = freezed,
    Object? endDate = freezed,
    Object? eventLocationAddress = freezed,
    Object? eventCity = freezed,
    Object? eventState = freezed,
    Object? eventCountry = freezed,
    Object? eventMainPhotoUrl = freezed,
    Object? eventOtherPhotosUrl = freezed,
    Object? tagList = freezed,
    Object? isPromoted = freezed,
    Object? isOpen = freezed,
    Object? isActive = freezed,
    Object? eventItems = freezed,
    Object? eventGuidelines = freezed,
    Object? gender = freezed,
    Object? targetCountry = freezed,
    Object? maritalStatus = freezed,
    Object? occupation = freezed,
    Object? eventFee = freezed,
    Object? buddyEventType = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: freezed == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorUsername: freezed == creatorUsername
          ? _self.creatorUsername
          : creatorUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorProfilePhotoUrl: freezed == creatorProfilePhotoUrl
          ? _self.creatorProfilePhotoUrl
          : creatorProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfBuddiesWanted: freezed == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfBuddiesJoined: freezed == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int?,
      shareLink: freezed == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationOrLengthInHrs: freezed == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventLocationAddress: freezed == eventLocationAddress
          ? _self.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCity: freezed == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String?,
      eventState: freezed == eventState
          ? _self.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCountry: freezed == eventCountry
          ? _self.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      eventMainPhotoUrl: freezed == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventOtherPhotosUrl: freezed == eventOtherPhotosUrl
          ? _self.eventOtherPhotosUrl
          : eventOtherPhotosUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tagList: freezed == tagList
          ? _self.tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPromoted: freezed == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventItems: freezed == eventItems
          ? _self.eventItems
          : eventItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      eventGuidelines: freezed == eventGuidelines
          ? _self.eventGuidelines
          : eventGuidelines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      targetCountry: freezed == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      eventFee: freezed == eventFee
          ? _self.eventFee
          : eventFee // ignore: cast_nullable_to_non_nullable
              as double?,
      buddyEventType: freezed == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEvent implements BuddyEvent {
  const _BuddyEvent(
      {required this.id,
      required this.creatorId,
      required this.creatorUsername,
      required this.creatorProfilePhotoUrl,
      required this.category,
      required this.title,
      required this.description,
      required this.noOfBuddiesWanted,
      required this.noOfBuddiesJoined,
      required this.shareLink,
      required this.startDate,
      required this.durationOrLengthInHrs,
      required this.endDate,
      required this.eventLocationAddress,
      required this.eventCity,
      required this.eventState,
      required this.eventCountry,
      required this.eventMainPhotoUrl,
      required final List<String>? eventOtherPhotosUrl,
      required final List<String>? tagList,
      required this.isPromoted,
      required this.isOpen,
      required this.isActive,
      required final List<String>? eventItems,
      required final List<String>? eventGuidelines,
      required this.gender,
      required this.targetCountry,
      required this.maritalStatus,
      required this.occupation,
      this.eventFee,
      this.buddyEventType})
      : _eventOtherPhotosUrl = eventOtherPhotosUrl,
        _tagList = tagList,
        _eventItems = eventItems,
        _eventGuidelines = eventGuidelines;
  factory _BuddyEvent.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventFromJson(json);

  @override
  final String id;
  @override
  final String? creatorId;
  @override
  final String? creatorUsername;
  @override
  final String? creatorProfilePhotoUrl;
  @override
  final String? category;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? noOfBuddiesWanted;
  @override
  final int? noOfBuddiesJoined;
  @override
  final String? shareLink;
  @override
  final DateTime? startDate;
  @override
  final int? durationOrLengthInHrs;
  @override
  final DateTime? endDate;
  @override
  final String? eventLocationAddress;
  @override
  final String? eventCity;
  @override
  final String? eventState;
  @override
  final String? eventCountry;
  @override
  final String? eventMainPhotoUrl;
  final List<String>? _eventOtherPhotosUrl;
  @override
  List<String>? get eventOtherPhotosUrl {
    final value = _eventOtherPhotosUrl;
    if (value == null) return null;
    if (_eventOtherPhotosUrl is EqualUnmodifiableListView)
      return _eventOtherPhotosUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tagList;
  @override
  List<String>? get tagList {
    final value = _tagList;
    if (value == null) return null;
    if (_tagList is EqualUnmodifiableListView) return _tagList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isPromoted;
  @override
  final bool? isOpen;
  @override
  final bool? isActive;
  final List<String>? _eventItems;
  @override
  List<String>? get eventItems {
    final value = _eventItems;
    if (value == null) return null;
    if (_eventItems is EqualUnmodifiableListView) return _eventItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _eventGuidelines;
  @override
  List<String>? get eventGuidelines {
    final value = _eventGuidelines;
    if (value == null) return null;
    if (_eventGuidelines is EqualUnmodifiableListView) return _eventGuidelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? gender;
  @override
  final String? targetCountry;
  @override
  final String? maritalStatus;
  @override
  final String? occupation;
  @override
  final double? eventFee;
  @override
  final int? buddyEventType;

  /// Create a copy of BuddyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventCopyWith<_BuddyEvent> get copyWith =>
      __$BuddyEventCopyWithImpl<_BuddyEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorUsername, creatorUsername) ||
                other.creatorUsername == creatorUsername) &&
            (identical(other.creatorProfilePhotoUrl, creatorProfilePhotoUrl) ||
                other.creatorProfilePhotoUrl == creatorProfilePhotoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.noOfBuddiesWanted, noOfBuddiesWanted) ||
                other.noOfBuddiesWanted == noOfBuddiesWanted) &&
            (identical(other.noOfBuddiesJoined, noOfBuddiesJoined) ||
                other.noOfBuddiesJoined == noOfBuddiesJoined) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.durationOrLengthInHrs, durationOrLengthInHrs) ||
                other.durationOrLengthInHrs == durationOrLengthInHrs) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.eventLocationAddress, eventLocationAddress) ||
                other.eventLocationAddress == eventLocationAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.eventCountry, eventCountry) ||
                other.eventCountry == eventCountry) &&
            (identical(other.eventMainPhotoUrl, eventMainPhotoUrl) ||
                other.eventMainPhotoUrl == eventMainPhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other._eventOtherPhotosUrl, _eventOtherPhotosUrl) &&
            const DeepCollectionEquality().equals(other._tagList, _tagList) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._eventItems, _eventItems) &&
            const DeepCollectionEquality()
                .equals(other._eventGuidelines, _eventGuidelines) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.targetCountry, targetCountry) ||
                other.targetCountry == targetCountry) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.eventFee, eventFee) ||
                other.eventFee == eventFee) &&
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        creatorId,
        creatorUsername,
        creatorProfilePhotoUrl,
        category,
        title,
        description,
        noOfBuddiesWanted,
        noOfBuddiesJoined,
        shareLink,
        startDate,
        durationOrLengthInHrs,
        endDate,
        eventLocationAddress,
        eventCity,
        eventState,
        eventCountry,
        eventMainPhotoUrl,
        const DeepCollectionEquality().hash(_eventOtherPhotosUrl),
        const DeepCollectionEquality().hash(_tagList),
        isPromoted,
        isOpen,
        isActive,
        const DeepCollectionEquality().hash(_eventItems),
        const DeepCollectionEquality().hash(_eventGuidelines),
        gender,
        targetCountry,
        maritalStatus,
        occupation,
        eventFee,
        buddyEventType
      ]);

  @override
  String toString() {
    return 'BuddyEvent(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl, tagList: $tagList, isPromoted: $isPromoted, isOpen: $isOpen, isActive: $isActive, eventItems: $eventItems, eventGuidelines: $eventGuidelines, gender: $gender, targetCountry: $targetCountry, maritalStatus: $maritalStatus, occupation: $occupation, eventFee: $eventFee, buddyEventType: $buddyEventType)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventCopyWith<$Res>
    implements $BuddyEventCopyWith<$Res> {
  factory _$BuddyEventCopyWith(
          _BuddyEvent value, $Res Function(_BuddyEvent) _then) =
      __$BuddyEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? creatorId,
      String? creatorUsername,
      String? creatorProfilePhotoUrl,
      String? category,
      String? title,
      String? description,
      int? noOfBuddiesWanted,
      int? noOfBuddiesJoined,
      String? shareLink,
      DateTime? startDate,
      int? durationOrLengthInHrs,
      DateTime? endDate,
      String? eventLocationAddress,
      String? eventCity,
      String? eventState,
      String? eventCountry,
      String? eventMainPhotoUrl,
      List<String>? eventOtherPhotosUrl,
      List<String>? tagList,
      bool? isPromoted,
      bool? isOpen,
      bool? isActive,
      List<String>? eventItems,
      List<String>? eventGuidelines,
      String? gender,
      String? targetCountry,
      String? maritalStatus,
      String? occupation,
      double? eventFee,
      int? buddyEventType});
}

/// @nodoc
class __$BuddyEventCopyWithImpl<$Res> implements _$BuddyEventCopyWith<$Res> {
  __$BuddyEventCopyWithImpl(this._self, this._then);

  final _BuddyEvent _self;
  final $Res Function(_BuddyEvent) _then;

  /// Create a copy of BuddyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? creatorId = freezed,
    Object? creatorUsername = freezed,
    Object? creatorProfilePhotoUrl = freezed,
    Object? category = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? noOfBuddiesWanted = freezed,
    Object? noOfBuddiesJoined = freezed,
    Object? shareLink = freezed,
    Object? startDate = freezed,
    Object? durationOrLengthInHrs = freezed,
    Object? endDate = freezed,
    Object? eventLocationAddress = freezed,
    Object? eventCity = freezed,
    Object? eventState = freezed,
    Object? eventCountry = freezed,
    Object? eventMainPhotoUrl = freezed,
    Object? eventOtherPhotosUrl = freezed,
    Object? tagList = freezed,
    Object? isPromoted = freezed,
    Object? isOpen = freezed,
    Object? isActive = freezed,
    Object? eventItems = freezed,
    Object? eventGuidelines = freezed,
    Object? gender = freezed,
    Object? targetCountry = freezed,
    Object? maritalStatus = freezed,
    Object? occupation = freezed,
    Object? eventFee = freezed,
    Object? buddyEventType = freezed,
  }) {
    return _then(_BuddyEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: freezed == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorUsername: freezed == creatorUsername
          ? _self.creatorUsername
          : creatorUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorProfilePhotoUrl: freezed == creatorProfilePhotoUrl
          ? _self.creatorProfilePhotoUrl
          : creatorProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfBuddiesWanted: freezed == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfBuddiesJoined: freezed == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int?,
      shareLink: freezed == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationOrLengthInHrs: freezed == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventLocationAddress: freezed == eventLocationAddress
          ? _self.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCity: freezed == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String?,
      eventState: freezed == eventState
          ? _self.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String?,
      eventCountry: freezed == eventCountry
          ? _self.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      eventMainPhotoUrl: freezed == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventOtherPhotosUrl: freezed == eventOtherPhotosUrl
          ? _self._eventOtherPhotosUrl
          : eventOtherPhotosUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tagList: freezed == tagList
          ? _self._tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPromoted: freezed == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOpen: freezed == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventItems: freezed == eventItems
          ? _self._eventItems
          : eventItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      eventGuidelines: freezed == eventGuidelines
          ? _self._eventGuidelines
          : eventGuidelines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      targetCountry: freezed == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      eventFee: freezed == eventFee
          ? _self.eventFee
          : eventFee // ignore: cast_nullable_to_non_nullable
              as double?,
      buddyEventType: freezed == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
