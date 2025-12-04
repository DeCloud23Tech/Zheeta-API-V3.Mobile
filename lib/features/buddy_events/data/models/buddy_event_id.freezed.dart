// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEventId {
  String get id;
  String get creatorId;
  String get creatorUsername;
  String get creatorProfilePhotoUrl;
  String get category;
  String get title;
  String get description;
  int get noOfBuddiesWanted;
  int get noOfBuddiesJoined;
  String get shareLink;
  String get startDate;
  int get durationOrLengthInHrs;
  String get endDate;
  String get eventLocationAddress;
  String get eventCity;
  String get eventState;
  String get eventCountry;
  String get eventMainPhotoUrl;
  List<String> get eventOtherPhotosUrl;
  String get buddyEventType;
  List<String> get tagList;
  bool get isPromoted;
  bool get isOpen;
  bool get isActive;
  List<String?>? get eventItems;
  List<String?>? get eventGuidelines;
  String get gender;
  String get targetCountry;
  String get maritalStatus;
  String get occupation;
  double? get eventFee;

  /// Create a copy of BuddyEventId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventIdCopyWith<BuddyEventId> get copyWith =>
      _$BuddyEventIdCopyWithImpl<BuddyEventId>(
          this as BuddyEventId, _$identity);

  /// Serializes this BuddyEventId to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventId &&
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
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType) &&
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
                other.eventFee == eventFee));
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
        buddyEventType,
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
        eventFee
      ]);

  @override
  String toString() {
    return 'BuddyEventId(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl, buddyEventType: $buddyEventType, tagList: $tagList, isPromoted: $isPromoted, isOpen: $isOpen, isActive: $isActive, eventItems: $eventItems, eventGuidelines: $eventGuidelines, gender: $gender, targetCountry: $targetCountry, maritalStatus: $maritalStatus, occupation: $occupation, eventFee: $eventFee)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventIdCopyWith<$Res> {
  factory $BuddyEventIdCopyWith(
          BuddyEventId value, $Res Function(BuddyEventId) _then) =
      _$BuddyEventIdCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String creatorUsername,
      String creatorProfilePhotoUrl,
      String category,
      String title,
      String description,
      int noOfBuddiesWanted,
      int noOfBuddiesJoined,
      String shareLink,
      String startDate,
      int durationOrLengthInHrs,
      String endDate,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      String eventMainPhotoUrl,
      List<String> eventOtherPhotosUrl,
      String buddyEventType,
      List<String> tagList,
      bool isPromoted,
      bool isOpen,
      bool isActive,
      List<String?>? eventItems,
      List<String?>? eventGuidelines,
      String gender,
      String targetCountry,
      String maritalStatus,
      String occupation,
      double? eventFee});
}

/// @nodoc
class _$BuddyEventIdCopyWithImpl<$Res> implements $BuddyEventIdCopyWith<$Res> {
  _$BuddyEventIdCopyWithImpl(this._self, this._then);

  final BuddyEventId _self;
  final $Res Function(BuddyEventId) _then;

  /// Create a copy of BuddyEventId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? creatorUsername = null,
    Object? creatorProfilePhotoUrl = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? noOfBuddiesWanted = null,
    Object? noOfBuddiesJoined = null,
    Object? shareLink = null,
    Object? startDate = null,
    Object? durationOrLengthInHrs = null,
    Object? endDate = null,
    Object? eventLocationAddress = null,
    Object? eventCity = null,
    Object? eventState = null,
    Object? eventCountry = null,
    Object? eventMainPhotoUrl = null,
    Object? eventOtherPhotosUrl = null,
    Object? buddyEventType = null,
    Object? tagList = null,
    Object? isPromoted = null,
    Object? isOpen = null,
    Object? isActive = null,
    Object? eventItems = freezed,
    Object? eventGuidelines = freezed,
    Object? gender = null,
    Object? targetCountry = null,
    Object? maritalStatus = null,
    Object? occupation = null,
    Object? eventFee = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorUsername: null == creatorUsername
          ? _self.creatorUsername
          : creatorUsername // ignore: cast_nullable_to_non_nullable
              as String,
      creatorProfilePhotoUrl: null == creatorProfilePhotoUrl
          ? _self.creatorProfilePhotoUrl
          : creatorProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      shareLink: null == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationOrLengthInHrs: null == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocationAddress: null == eventLocationAddress
          ? _self.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventCity: null == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _self.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String,
      eventCountry: null == eventCountry
          ? _self.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventOtherPhotosUrl: null == eventOtherPhotosUrl
          ? _self.eventOtherPhotosUrl
          : eventOtherPhotosUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buddyEventType: null == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as String,
      tagList: null == tagList
          ? _self.tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPromoted: null == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      eventItems: freezed == eventItems
          ? _self.eventItems
          : eventItems // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      eventGuidelines: freezed == eventGuidelines
          ? _self.eventGuidelines
          : eventGuidelines // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      targetCountry: null == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String,
      maritalStatus: null == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      eventFee: freezed == eventFee
          ? _self.eventFee
          : eventFee // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEventId implements BuddyEventId {
  const _BuddyEventId(
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
      required final List<String> eventOtherPhotosUrl,
      required this.buddyEventType,
      required final List<String> tagList,
      required this.isPromoted,
      required this.isOpen,
      required this.isActive,
      final List<String?>? eventItems,
      final List<String?>? eventGuidelines,
      required this.gender,
      required this.targetCountry,
      required this.maritalStatus,
      required this.occupation,
      this.eventFee})
      : _eventOtherPhotosUrl = eventOtherPhotosUrl,
        _tagList = tagList,
        _eventItems = eventItems,
        _eventGuidelines = eventGuidelines;
  factory _BuddyEventId.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventIdFromJson(json);

  @override
  final String id;
  @override
  final String creatorId;
  @override
  final String creatorUsername;
  @override
  final String creatorProfilePhotoUrl;
  @override
  final String category;
  @override
  final String title;
  @override
  final String description;
  @override
  final int noOfBuddiesWanted;
  @override
  final int noOfBuddiesJoined;
  @override
  final String shareLink;
  @override
  final String startDate;
  @override
  final int durationOrLengthInHrs;
  @override
  final String endDate;
  @override
  final String eventLocationAddress;
  @override
  final String eventCity;
  @override
  final String eventState;
  @override
  final String eventCountry;
  @override
  final String eventMainPhotoUrl;
  final List<String> _eventOtherPhotosUrl;
  @override
  List<String> get eventOtherPhotosUrl {
    if (_eventOtherPhotosUrl is EqualUnmodifiableListView)
      return _eventOtherPhotosUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventOtherPhotosUrl);
  }

  @override
  final String buddyEventType;
  final List<String> _tagList;
  @override
  List<String> get tagList {
    if (_tagList is EqualUnmodifiableListView) return _tagList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagList);
  }

  @override
  final bool isPromoted;
  @override
  final bool isOpen;
  @override
  final bool isActive;
  final List<String?>? _eventItems;
  @override
  List<String?>? get eventItems {
    final value = _eventItems;
    if (value == null) return null;
    if (_eventItems is EqualUnmodifiableListView) return _eventItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String?>? _eventGuidelines;
  @override
  List<String?>? get eventGuidelines {
    final value = _eventGuidelines;
    if (value == null) return null;
    if (_eventGuidelines is EqualUnmodifiableListView) return _eventGuidelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String gender;
  @override
  final String targetCountry;
  @override
  final String maritalStatus;
  @override
  final String occupation;
  @override
  final double? eventFee;

  /// Create a copy of BuddyEventId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventIdCopyWith<_BuddyEventId> get copyWith =>
      __$BuddyEventIdCopyWithImpl<_BuddyEventId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventIdToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventId &&
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
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType) &&
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
                other.eventFee == eventFee));
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
        buddyEventType,
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
        eventFee
      ]);

  @override
  String toString() {
    return 'BuddyEventId(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl, buddyEventType: $buddyEventType, tagList: $tagList, isPromoted: $isPromoted, isOpen: $isOpen, isActive: $isActive, eventItems: $eventItems, eventGuidelines: $eventGuidelines, gender: $gender, targetCountry: $targetCountry, maritalStatus: $maritalStatus, occupation: $occupation, eventFee: $eventFee)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventIdCopyWith<$Res>
    implements $BuddyEventIdCopyWith<$Res> {
  factory _$BuddyEventIdCopyWith(
          _BuddyEventId value, $Res Function(_BuddyEventId) _then) =
      __$BuddyEventIdCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String creatorUsername,
      String creatorProfilePhotoUrl,
      String category,
      String title,
      String description,
      int noOfBuddiesWanted,
      int noOfBuddiesJoined,
      String shareLink,
      String startDate,
      int durationOrLengthInHrs,
      String endDate,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      String eventMainPhotoUrl,
      List<String> eventOtherPhotosUrl,
      String buddyEventType,
      List<String> tagList,
      bool isPromoted,
      bool isOpen,
      bool isActive,
      List<String?>? eventItems,
      List<String?>? eventGuidelines,
      String gender,
      String targetCountry,
      String maritalStatus,
      String occupation,
      double? eventFee});
}

/// @nodoc
class __$BuddyEventIdCopyWithImpl<$Res>
    implements _$BuddyEventIdCopyWith<$Res> {
  __$BuddyEventIdCopyWithImpl(this._self, this._then);

  final _BuddyEventId _self;
  final $Res Function(_BuddyEventId) _then;

  /// Create a copy of BuddyEventId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? creatorUsername = null,
    Object? creatorProfilePhotoUrl = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? noOfBuddiesWanted = null,
    Object? noOfBuddiesJoined = null,
    Object? shareLink = null,
    Object? startDate = null,
    Object? durationOrLengthInHrs = null,
    Object? endDate = null,
    Object? eventLocationAddress = null,
    Object? eventCity = null,
    Object? eventState = null,
    Object? eventCountry = null,
    Object? eventMainPhotoUrl = null,
    Object? eventOtherPhotosUrl = null,
    Object? buddyEventType = null,
    Object? tagList = null,
    Object? isPromoted = null,
    Object? isOpen = null,
    Object? isActive = null,
    Object? eventItems = freezed,
    Object? eventGuidelines = freezed,
    Object? gender = null,
    Object? targetCountry = null,
    Object? maritalStatus = null,
    Object? occupation = null,
    Object? eventFee = freezed,
  }) {
    return _then(_BuddyEventId(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorUsername: null == creatorUsername
          ? _self.creatorUsername
          : creatorUsername // ignore: cast_nullable_to_non_nullable
              as String,
      creatorProfilePhotoUrl: null == creatorProfilePhotoUrl
          ? _self.creatorProfilePhotoUrl
          : creatorProfilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      shareLink: null == shareLink
          ? _self.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      durationOrLengthInHrs: null == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocationAddress: null == eventLocationAddress
          ? _self.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventCity: null == eventCity
          ? _self.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _self.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String,
      eventCountry: null == eventCountry
          ? _self.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      eventOtherPhotosUrl: null == eventOtherPhotosUrl
          ? _self._eventOtherPhotosUrl
          : eventOtherPhotosUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      buddyEventType: null == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as String,
      tagList: null == tagList
          ? _self._tagList
          : tagList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isPromoted: null == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpen: null == isOpen
          ? _self.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      eventItems: freezed == eventItems
          ? _self._eventItems
          : eventItems // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      eventGuidelines: freezed == eventGuidelines
          ? _self._eventGuidelines
          : eventGuidelines // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      targetCountry: null == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String,
      maritalStatus: null == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      eventFee: freezed == eventFee
          ? _self.eventFee
          : eventFee // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
