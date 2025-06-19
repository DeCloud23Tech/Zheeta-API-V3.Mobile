// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuddySearchResponse _$BuddySearchResponseFromJson(Map<String, dynamic> json) {
  return _BuddySearchResponse.fromJson(json);
}

/// @nodoc
mixin _$BuddySearchResponse {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  List<BuddyEventSearch> get data => throw _privateConstructorUsedError;

  /// Serializes this BuddySearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuddySearchResponseCopyWith<BuddySearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuddySearchResponseCopyWith<$Res> {
  factory $BuddySearchResponseCopyWith(
          BuddySearchResponse value, $Res Function(BuddySearchResponse) then) =
      _$BuddySearchResponseCopyWithImpl<$Res, BuddySearchResponse>;
  @useResult
  $Res call(
      {int statusCode,
      String message,
      bool success,
      int totalCount,
      List<BuddyEventSearch> data});
}

/// @nodoc
class _$BuddySearchResponseCopyWithImpl<$Res, $Val extends BuddySearchResponse>
    implements $BuddySearchResponseCopyWith<$Res> {
  _$BuddySearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuddyEventSearch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuddySearchResponseImplCopyWith<$Res>
    implements $BuddySearchResponseCopyWith<$Res> {
  factory _$$BuddySearchResponseImplCopyWith(_$BuddySearchResponseImpl value,
          $Res Function(_$BuddySearchResponseImpl) then) =
      __$$BuddySearchResponseImplCopyWithImpl<$Res>;
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
class __$$BuddySearchResponseImplCopyWithImpl<$Res>
    extends _$BuddySearchResponseCopyWithImpl<$Res, _$BuddySearchResponseImpl>
    implements _$$BuddySearchResponseImplCopyWith<$Res> {
  __$$BuddySearchResponseImplCopyWithImpl(_$BuddySearchResponseImpl _value,
      $Res Function(_$BuddySearchResponseImpl) _then)
      : super(_value, _then);

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
    return _then(_$BuddySearchResponseImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BuddyEventSearch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuddySearchResponseImpl implements _BuddySearchResponse {
  const _$BuddySearchResponseImpl(
      {required this.statusCode,
      required this.message,
      required this.success,
      required this.totalCount,
      required final List<BuddyEventSearch> data})
      : _data = data;

  factory _$BuddySearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuddySearchResponseImplFromJson(json);

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

  @override
  String toString() {
    return 'BuddySearchResponse(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuddySearchResponseImpl &&
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

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuddySearchResponseImplCopyWith<_$BuddySearchResponseImpl> get copyWith =>
      __$$BuddySearchResponseImplCopyWithImpl<_$BuddySearchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuddySearchResponseImplToJson(
      this,
    );
  }
}

abstract class _BuddySearchResponse implements BuddySearchResponse {
  const factory _BuddySearchResponse(
      {required final int statusCode,
      required final String message,
      required final bool success,
      required final int totalCount,
      required final List<BuddyEventSearch> data}) = _$BuddySearchResponseImpl;

  factory _BuddySearchResponse.fromJson(Map<String, dynamic> json) =
      _$BuddySearchResponseImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  int get totalCount;
  @override
  List<BuddyEventSearch> get data;

  /// Create a copy of BuddySearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuddySearchResponseImplCopyWith<_$BuddySearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuddyEventSearch _$BuddyEventSearchFromJson(Map<String, dynamic> json) {
  return _BuddyEventSearch.fromJson(json);
}

/// @nodoc
mixin _$BuddyEventSearch {
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get eventMainPhotoUrl => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get eventLocationAddress => throw _privateConstructorUsedError;
  String get eventCity => throw _privateConstructorUsedError;
  String get eventState => throw _privateConstructorUsedError;
  String get eventCountry => throw _privateConstructorUsedError;
  int get noOfBuddiesWanted => throw _privateConstructorUsedError;
  int get noOfBuddiesJoined => throw _privateConstructorUsedError;
  int get buddyEventType => throw _privateConstructorUsedError;
  bool get isPromoted => throw _privateConstructorUsedError;
  double? get eventParticipationCost => throw _privateConstructorUsedError;

  /// Serializes this BuddyEventSearch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuddyEventSearchCopyWith<BuddyEventSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuddyEventSearchCopyWith<$Res> {
  factory $BuddyEventSearchCopyWith(
          BuddyEventSearch value, $Res Function(BuddyEventSearch) then) =
      _$BuddyEventSearchCopyWithImpl<$Res, BuddyEventSearch>;
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
class _$BuddyEventSearchCopyWithImpl<$Res, $Val extends BuddyEventSearch>
    implements $BuddyEventSearchCopyWith<$Res> {
  _$BuddyEventSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _value.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocationAddress: null == eventLocationAddress
          ? _value.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventCity: null == eventCity
          ? _value.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String,
      eventCountry: null == eventCountry
          ? _value.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String,
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _value.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _value.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      buddyEventType: null == buddyEventType
          ? _value.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      eventParticipationCost: freezed == eventParticipationCost
          ? _value.eventParticipationCost
          : eventParticipationCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuddyEventSearchImplCopyWith<$Res>
    implements $BuddyEventSearchCopyWith<$Res> {
  factory _$$BuddyEventSearchImplCopyWith(_$BuddyEventSearchImpl value,
          $Res Function(_$BuddyEventSearchImpl) then) =
      __$$BuddyEventSearchImplCopyWithImpl<$Res>;
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
class __$$BuddyEventSearchImplCopyWithImpl<$Res>
    extends _$BuddyEventSearchCopyWithImpl<$Res, _$BuddyEventSearchImpl>
    implements _$$BuddyEventSearchImplCopyWith<$Res> {
  __$$BuddyEventSearchImplCopyWithImpl(_$BuddyEventSearchImpl _value,
      $Res Function(_$BuddyEventSearchImpl) _then)
      : super(_value, _then);

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
    return _then(_$BuddyEventSearchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      eventMainPhotoUrl: null == eventMainPhotoUrl
          ? _value.eventMainPhotoUrl
          : eventMainPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocationAddress: null == eventLocationAddress
          ? _value.eventLocationAddress
          : eventLocationAddress // ignore: cast_nullable_to_non_nullable
              as String,
      eventCity: null == eventCity
          ? _value.eventCity
          : eventCity // ignore: cast_nullable_to_non_nullable
              as String,
      eventState: null == eventState
          ? _value.eventState
          : eventState // ignore: cast_nullable_to_non_nullable
              as String,
      eventCountry: null == eventCountry
          ? _value.eventCountry
          : eventCountry // ignore: cast_nullable_to_non_nullable
              as String,
      noOfBuddiesWanted: null == noOfBuddiesWanted
          ? _value.noOfBuddiesWanted
          : noOfBuddiesWanted // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddiesJoined: null == noOfBuddiesJoined
          ? _value.noOfBuddiesJoined
          : noOfBuddiesJoined // ignore: cast_nullable_to_non_nullable
              as int,
      buddyEventType: null == buddyEventType
          ? _value.buddyEventType
          : buddyEventType // ignore: cast_nullable_to_non_nullable
              as int,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      eventParticipationCost: freezed == eventParticipationCost
          ? _value.eventParticipationCost
          : eventParticipationCost // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuddyEventSearchImpl implements _BuddyEventSearch {
  const _$BuddyEventSearchImpl(
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

  factory _$BuddyEventSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuddyEventSearchImplFromJson(json);

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

  @override
  String toString() {
    return 'BuddyEventSearch(id: $id, creatorId: $creatorId, title: $title, description: $description, eventMainPhotoUrl: $eventMainPhotoUrl, startDate: $startDate, category: $category, eventLocationAddress: $eventLocationAddress, eventCity: $eventCity, eventState: $eventState, eventCountry: $eventCountry, noOfBuddiesWanted: $noOfBuddiesWanted, noOfBuddiesJoined: $noOfBuddiesJoined, buddyEventType: $buddyEventType, isPromoted: $isPromoted, eventParticipationCost: $eventParticipationCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuddyEventSearchImpl &&
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

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuddyEventSearchImplCopyWith<_$BuddyEventSearchImpl> get copyWith =>
      __$$BuddyEventSearchImplCopyWithImpl<_$BuddyEventSearchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuddyEventSearchImplToJson(
      this,
    );
  }
}

abstract class _BuddyEventSearch implements BuddyEventSearch {
  const factory _BuddyEventSearch(
      {required final String id,
      required final String creatorId,
      required final String title,
      required final String description,
      required final String eventMainPhotoUrl,
      required final DateTime startDate,
      required final String category,
      required final String eventLocationAddress,
      required final String eventCity,
      required final String eventState,
      required final String eventCountry,
      required final int noOfBuddiesWanted,
      required final int noOfBuddiesJoined,
      required final int buddyEventType,
      required final bool isPromoted,
      final double? eventParticipationCost}) = _$BuddyEventSearchImpl;

  factory _BuddyEventSearch.fromJson(Map<String, dynamic> json) =
      _$BuddyEventSearchImpl.fromJson;

  @override
  String get id;
  @override
  String get creatorId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get eventMainPhotoUrl;
  @override
  DateTime get startDate;
  @override
  String get category;
  @override
  String get eventLocationAddress;
  @override
  String get eventCity;
  @override
  String get eventState;
  @override
  String get eventCountry;
  @override
  int get noOfBuddiesWanted;
  @override
  int get noOfBuddiesJoined;
  @override
  int get buddyEventType;
  @override
  bool get isPromoted;
  @override
  double? get eventParticipationCost;

  /// Create a copy of BuddyEventSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuddyEventSearchImplCopyWith<_$BuddyEventSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
