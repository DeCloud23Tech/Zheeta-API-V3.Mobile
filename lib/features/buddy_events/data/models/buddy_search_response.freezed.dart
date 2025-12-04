// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddySearchResponse {
  int get statusCode;
  String get message;
  bool get success;
  int get totalCount;
  List<BuddyEventSearch> get data;

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddySearchResponseCopyWith<BuddySearchResponse> get copyWith =>
      _$BuddySearchResponseCopyWithImpl<BuddySearchResponse>(
          this as BuddySearchResponse, _$identity);

  /// Serializes this BuddySearchResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddySearchResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success,
      totalCount, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'BuddySearchResponse(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class $BuddySearchResponseCopyWith<$Res> {
  factory $BuddySearchResponseCopyWith(
          BuddySearchResponse value, $Res Function(BuddySearchResponse) _then) =
      _$BuddySearchResponseCopyWithImpl;
  @useResult
  $Res call(
      {int statusCode,
      String message,
      bool success,
      int totalCount,
      List<BuddyEventSearch> data});
}

/// @nodoc
class _$BuddySearchResponseCopyWithImpl<$Res>
    implements $BuddySearchResponseCopyWith<$Res> {
  _$BuddySearchResponseCopyWithImpl(this._self, this._then);

  final BuddySearchResponse _self;
  final $Res Function(BuddySearchResponse) _then;

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuddyEventSearch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddySearchResponse implements BuddySearchResponse {
  const _BuddySearchResponse(
      {required this.statusCode,
      required this.message,
      required this.success,
      required this.totalCount,
      required final List<BuddyEventSearch> data})
      : _data = data;
  factory _BuddySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$BuddySearchResponseFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;
  @override
  final int totalCount;
  final List<BuddyEventSearch> _data;
  @override
  List<BuddyEventSearch> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddySearchResponseCopyWith<_BuddySearchResponse> get copyWith =>
      __$BuddySearchResponseCopyWithImpl<_BuddySearchResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddySearchResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddySearchResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success,
      totalCount, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'BuddySearchResponse(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$BuddySearchResponseCopyWith<$Res>
    implements $BuddySearchResponseCopyWith<$Res> {
  factory _$BuddySearchResponseCopyWith(_BuddySearchResponse value,
          $Res Function(_BuddySearchResponse) _then) =
      __$BuddySearchResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int statusCode,
      String message,
      bool success,
      int totalCount,
      List<BuddyEventSearch> data});
}

/// @nodoc
class __$BuddySearchResponseCopyWithImpl<$Res>
    implements _$BuddySearchResponseCopyWith<$Res> {
  __$BuddySearchResponseCopyWithImpl(this._self, this._then);

  final _BuddySearchResponse _self;
  final $Res Function(_BuddySearchResponse) _then;

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_BuddySearchResponse(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuddyEventSearch>,
    ));
  }
}

/// @nodoc
mixin _$BuddyEventSearch {
  String get id;
  String get creatorId;
  String get title;
  String get description;
  String get eventMainPhotoUrl;
  DateTime get startDate;
  String get category;
  String get eventLocationAddress;
  String get eventCity;
  String get eventState;
  String get eventCountry;
  int get noOfBuddiesWanted;
  int get noOfBuddiesJoined;
  int get buddyEventType;
  bool get isPromoted;
  double? get eventParticipationCost;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventSearchCopyWith<BuddyEventSearch> get copyWith =>
      _$BuddyEventSearchCopyWithImpl<BuddyEventSearch>(
          this as BuddyEventSearch, _$identity);

  /// Serializes this BuddyEventSearch to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventSearch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventMainPhotoUrl, eventMainPhotoUrl) ||
                other.eventMainPhotoUrl == eventMainPhotoUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.eventLocationAddress, eventLocationAddress) ||
                other.eventLocationAddress == eventLocationAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.eventCountry, eventCountry) ||
                other.eventCountry == eventCountry) &&
            (identical(other.noOfBuddiesWanted, noOfBuddiesWanted) ||
                other.noOfBuddiesWanted == noOfBuddiesWanted) &&
            (identical(other.noOfBuddiesJoined, noOfBuddiesJoined) ||
                other.noOfBuddiesJoined == noOfBuddiesJoined) &&
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.eventParticipationCost, eventParticipationCost) ||
                other.eventParticipationCost == eventParticipationCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      title,
      description,
      eventMainPhotoUrl,
      startDate,
      category,
      eventLocationAddress,
      eventCity,
      eventState,
      eventCountry,
      noOfBuddiesWanted,
      noOfBuddiesJoined,
      buddyEventType,
      isPromoted,
      eventParticipationCost);

  @override
  String toString() {
    return 'BuddyEventSearch(id: $id, creatorId: $creatorId, title: $title, description: $description, eventMainPhotoUrl: $eventMainPhotoUrl, startDate: $startDate, category: $category, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, buddyEventType: $buddyEventType, isPromoted: $isPromoted, eventParticipationCost: $eventParticipationCost)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventSearchCopyWith<$Res> {
  factory $BuddyEventSearchCopyWith(
          BuddyEventSearch value, $Res Function(BuddyEventSearch) _then) =
      _$BuddyEventSearchCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String title,
      String description,
      String eventMainPhotoUrl,
      DateTime startDate,
      String category,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      int noOfBuddiesWanted,
      int noOfBuddiesJoined,
      int buddyEventType,
      bool isPromoted,
      double? eventParticipationCost});
}

/// @nodoc
class _$BuddyEventSearchCopyWithImpl<$Res>
    implements $BuddyEventSearchCopyWith<$Res> {
  _$BuddyEventSearchCopyWithImpl(this._self, this._then);

  final BuddyEventSearch _self;
  final $Res Function(BuddyEventSearch) _then;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? title = null,
    Object? description = null,
    Object? eventMainPhotoUrl = null,
    Object? startDate = null,
    Object? category = null,
    Object? eventLocationAddress = null,
    Object? eventCity = null,
    Object? eventState = null,
    Object? eventCountry = null,
    Object? noOfBuddiesWanted = null,
    Object? noOfBuddiesJoined = null,
    Object? buddyEventType = null,
    Object? isPromoted = null,
    Object? eventParticipationCost = freezed,
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
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
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
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      buddyEventType: null == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int,
      isPromoted: null == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      eventParticipationCost: freezed == eventParticipationCost
          ? _self.eventParticipationCost
          : eventParticipationCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEventSearch implements BuddyEventSearch {
  const _BuddyEventSearch(
      {required this.id,
      required this.creatorId,
      required this.title,
      required this.description,
      required this.eventMainPhotoUrl,
      required this.startDate,
      required this.category,
      required this.eventLocationAddress,
      required this.eventCity,
      required this.eventState,
      required this.eventCountry,
      required this.noOfBuddiesWanted,
      required this.noOfBuddiesJoined,
      required this.buddyEventType,
      required this.isPromoted,
      this.eventParticipationCost});
  factory _BuddyEventSearch.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventSearchFromJson(json);

  @override
  final String id;
  @override
  final String creatorId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String eventMainPhotoUrl;
  @override
  final DateTime startDate;
  @override
  final String category;
  @override
  final String eventLocationAddress;
  @override
  final String eventCity;
  @override
  final String eventState;
  @override
  final String eventCountry;
  @override
  final int noOfBuddiesWanted;
  @override
  final int noOfBuddiesJoined;
  @override
  final int buddyEventType;
  @override
  final bool isPromoted;
  @override
  final double? eventParticipationCost;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventSearchCopyWith<_BuddyEventSearch> get copyWith =>
      __$BuddyEventSearchCopyWithImpl<_BuddyEventSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventSearchToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventSearch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventMainPhotoUrl, eventMainPhotoUrl) ||
                other.eventMainPhotoUrl == eventMainPhotoUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.eventLocationAddress, eventLocationAddress) ||
                other.eventLocationAddress == eventLocationAddress) &&
            (identical(other.eventCity, eventCity) ||
                other.eventCity == eventCity) &&
            (identical(other.eventState, eventState) ||
                other.eventState == eventState) &&
            (identical(other.eventCountry, eventCountry) ||
                other.eventCountry == eventCountry) &&
            (identical(other.noOfBuddiesWanted, noOfBuddiesWanted) ||
                other.noOfBuddiesWanted == noOfBuddiesWanted) &&
            (identical(other.noOfBuddiesJoined, noOfBuddiesJoined) ||
                other.noOfBuddiesJoined == noOfBuddiesJoined) &&
            (identical(other.buddyEventType, buddyEventType) ||
                other.buddyEventType == buddyEventType) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.eventParticipationCost, eventParticipationCost) ||
                other.eventParticipationCost == eventParticipationCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      title,
      description,
      eventMainPhotoUrl,
      startDate,
      category,
      eventLocationAddress,
      eventCity,
      eventState,
      eventCountry,
      noOfBuddiesWanted,
      noOfBuddiesJoined,
      buddyEventType,
      isPromoted,
      eventParticipationCost);

  @override
  String toString() {
    return 'BuddyEventSearch(id: $id, creatorId: $creatorId, title: $title, description: $description, eventMainPhotoUrl: $eventMainPhotoUrl, startDate: $startDate, category: $category, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, buddyEventType: $buddyEventType, isPromoted: $isPromoted, eventParticipationCost: $eventParticipationCost)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventSearchCopyWith<$Res>
    implements $BuddyEventSearchCopyWith<$Res> {
  factory _$BuddyEventSearchCopyWith(
          _BuddyEventSearch value, $Res Function(_BuddyEventSearch) _then) =
      __$BuddyEventSearchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String title,
      String description,
      String eventMainPhotoUrl,
      DateTime startDate,
      String category,
      String eventLocationAddress,
      String eventCity,
      String eventState,
      String eventCountry,
      int noOfBuddiesWanted,
      int noOfBuddiesJoined,
      int buddyEventType,
      bool isPromoted,
      double? eventParticipationCost});
}

/// @nodoc
class __$BuddyEventSearchCopyWithImpl<$Res>
    implements _$BuddyEventSearchCopyWith<$Res> {
  __$BuddyEventSearchCopyWithImpl(this._self, this._then);

  final _BuddyEventSearch _self;
  final $Res Function(_BuddyEventSearch) _then;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? title = null,
    Object? description = null,
    Object? eventMainPhotoUrl = null,
    Object? startDate = null,
    Object? category = null,
    Object? eventLocationAddress = null,
    Object? eventCity = null,
    Object? eventState = null,
    Object? eventCountry = null,
    Object? noOfBuddiesWanted = null,
    Object? noOfBuddiesJoined = null,
    Object? buddyEventType = null,
    Object? isPromoted = null,
    Object? eventParticipationCost = freezed,
  }) {
    return _then(_BuddyEventSearch(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _self.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _self.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
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
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _self.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _self.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      buddyEventType: null == buddyEventType
          ? _self.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int,
      isPromoted: null == isPromoted
          ? _self.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      eventParticipationCost: freezed == eventParticipationCost
          ? _self.eventParticipationCost
          : eventParticipationCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
