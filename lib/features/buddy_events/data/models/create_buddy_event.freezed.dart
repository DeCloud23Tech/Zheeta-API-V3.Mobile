// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_buddy_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBuddyEventData {
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
  DateTime get startDate;
  int get durationOrLengthInHrs;
  DateTime get endDate;
  String get eventLocationAddress;
  String get eventCity;
  String get eventState;
  String get eventCountry;
  String get eventMainPhotoUrl;
  List<String> get eventOtherPhotosUrl;

  /// Create a copy of CreateBuddyEventData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateBuddyEventDataCopyWith<CreateBuddyEventData> get copyWith =>
      _$CreateBuddyEventDataCopyWithImpl<CreateBuddyEventData>(
          this as CreateBuddyEventData, _$identity);

  /// Serializes this CreateBuddyEventData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateBuddyEventData &&
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
                .equals(other.eventOtherPhotosUrl, eventOtherPhotosUrl));
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
        const DeepCollectionEquality().hash(eventOtherPhotosUrl)
      ]);

  @override
  String toString() {
    return 'CreateBuddyEventData(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl)';
  }
}

/// @nodoc
abstract mixin class $CreateBuddyEventDataCopyWith<$Res> {
  factory $CreateBuddyEventDataCopyWith(CreateBuddyEventData value,
          $Res Function(CreateBuddyEventData) _then) =
      _$CreateBuddyEventDataCopyWithImpl;
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
      DateTime startDate,
      int durationOrLengthInHrs,
      DateTime endDate,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      String eventMainPhotoUrl,
      List<String> eventOtherPhotosUrl});
}

/// @nodoc
class _$CreateBuddyEventDataCopyWithImpl<$Res>
    implements $CreateBuddyEventDataCopyWith<$Res> {
  _$CreateBuddyEventDataCopyWithImpl(this._self, this._then);

  final CreateBuddyEventData _self;
  final $Res Function(CreateBuddyEventData) _then;

  /// Create a copy of CreateBuddyEventData
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
              as DateTime,
      durationOrLengthInHrs: null == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreateBuddyEventData implements CreateBuddyEventData {
  const _CreateBuddyEventData(
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
      required final List<String> eventOtherPhotosUrl})
      : _eventOtherPhotosUrl = eventOtherPhotosUrl;
  factory _CreateBuddyEventData.fromJson(Map<String, dynamic> json) =>
      _$CreateBuddyEventDataFromJson(json);

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
  final DateTime startDate;
  @override
  final int durationOrLengthInHrs;
  @override
  final DateTime endDate;
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

  /// Create a copy of CreateBuddyEventData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateBuddyEventDataCopyWith<_CreateBuddyEventData> get copyWith =>
      __$CreateBuddyEventDataCopyWithImpl<_CreateBuddyEventData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateBuddyEventDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateBuddyEventData &&
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
                .equals(other._eventOtherPhotosUrl, _eventOtherPhotosUrl));
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
        const DeepCollectionEquality().hash(_eventOtherPhotosUrl)
      ]);

  @override
  String toString() {
    return 'CreateBuddyEventData(id: $id, creatorId: $creatorId, creatorUsername: $creatorUsername, creatorProfilePhotoUrl: $creatorProfilePhotoUrl, category: $category, title: $title, description: $description, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, shareLink: $shareLink, startDate: $startDate, durationOrLengthInHrs: $durationOrLengthInHrs, endDate: $endDate, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, eventMainPhotoUrl: $eventMainPhotoUrl, eventOtherPhotosUrl: $eventOtherPhotosUrl)';
  }
}

/// @nodoc
abstract mixin class _$CreateBuddyEventDataCopyWith<$Res>
    implements $CreateBuddyEventDataCopyWith<$Res> {
  factory _$CreateBuddyEventDataCopyWith(_CreateBuddyEventData value,
          $Res Function(_CreateBuddyEventData) _then) =
      __$CreateBuddyEventDataCopyWithImpl;
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
      DateTime startDate,
      int durationOrLengthInHrs,
      DateTime endDate,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      String eventMainPhotoUrl,
      List<String> eventOtherPhotosUrl});
}

/// @nodoc
class __$CreateBuddyEventDataCopyWithImpl<$Res>
    implements _$CreateBuddyEventDataCopyWith<$Res> {
  __$CreateBuddyEventDataCopyWithImpl(this._self, this._then);

  final _CreateBuddyEventData _self;
  final $Res Function(_CreateBuddyEventData) _then;

  /// Create a copy of CreateBuddyEventData
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
  }) {
    return _then(_CreateBuddyEventData(
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
              as DateTime,
      durationOrLengthInHrs: null == durationOrLengthInHrs
          ? _self.durationOrLengthInHrs
          : durationOrLengthInHrs // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ));
  }
}

// dart format on
