// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_by_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchUserByCustomerListModel _$SearchUserByCustomerListModelFromJson(
    Map<String, dynamic> json) {
  return _SearchUserByCustomerListModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserByCustomerListModel {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;
  List<SearchUserByCustomerModel>? get data =>
      throw _privateConstructorUsedError;

  /// Serializes this SearchUserByCustomerListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUserByCustomerListModelCopyWith<SearchUserByCustomerListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserByCustomerListModelCopyWith<$Res> {
  factory $SearchUserByCustomerListModelCopyWith(
          SearchUserByCustomerListModel value,
          $Res Function(SearchUserByCustomerListModel) then) =
      _$SearchUserByCustomerListModelCopyWithImpl<$Res,
          SearchUserByCustomerListModel>;
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      bool? success,
      int? totalCount,
      List<SearchUserByCustomerModel>? data});
}

/// @nodoc
class _$SearchUserByCustomerListModelCopyWithImpl<$Res,
        $Val extends SearchUserByCustomerListModel>
    implements $SearchUserByCustomerListModelCopyWith<$Res> {
  _$SearchUserByCustomerListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? success = freezed,
    Object? totalCount = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUserByCustomerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserByCustomerListModelImplCopyWith<$Res>
    implements $SearchUserByCustomerListModelCopyWith<$Res> {
  factory _$$SearchUserByCustomerListModelImplCopyWith(
          _$SearchUserByCustomerListModelImpl value,
          $Res Function(_$SearchUserByCustomerListModelImpl) then) =
      __$$SearchUserByCustomerListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      bool? success,
      int? totalCount,
      List<SearchUserByCustomerModel>? data});
}

/// @nodoc
class __$$SearchUserByCustomerListModelImplCopyWithImpl<$Res>
    extends _$SearchUserByCustomerListModelCopyWithImpl<$Res,
        _$SearchUserByCustomerListModelImpl>
    implements _$$SearchUserByCustomerListModelImplCopyWith<$Res> {
  __$$SearchUserByCustomerListModelImplCopyWithImpl(
      _$SearchUserByCustomerListModelImpl _value,
      $Res Function(_$SearchUserByCustomerListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? success = freezed,
    Object? totalCount = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SearchUserByCustomerListModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUserByCustomerModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUserByCustomerListModelImpl
    implements _SearchUserByCustomerListModel {
  _$SearchUserByCustomerListModelImpl(
      {this.statusCode,
      this.message,
      this.success,
      this.totalCount,
      final List<SearchUserByCustomerModel>? data})
      : _data = data;

  factory _$SearchUserByCustomerListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchUserByCustomerListModelImplFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? message;
  @override
  final bool? success;
  @override
  final int? totalCount;
  final List<SearchUserByCustomerModel>? _data;
  @override
  List<SearchUserByCustomerModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchUserByCustomerListModel(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserByCustomerListModelImpl &&
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

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserByCustomerListModelImplCopyWith<
          _$SearchUserByCustomerListModelImpl>
      get copyWith => __$$SearchUserByCustomerListModelImplCopyWithImpl<
          _$SearchUserByCustomerListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserByCustomerListModelImplToJson(
      this,
    );
  }
}

abstract class _SearchUserByCustomerListModel
    implements SearchUserByCustomerListModel {
  factory _SearchUserByCustomerListModel(
          {final int? statusCode,
          final String? message,
          final bool? success,
          final int? totalCount,
          final List<SearchUserByCustomerModel>? data}) =
      _$SearchUserByCustomerListModelImpl;

  factory _SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserByCustomerListModelImpl.fromJson;

  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  int? get totalCount;
  @override
  List<SearchUserByCustomerModel>? get data;

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserByCustomerListModelImplCopyWith<
          _$SearchUserByCustomerListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchUserByCustomerModel _$SearchUserByCustomerModelFromJson(
    Map<String, dynamic> json) {
  return _SearchUserByCustomerModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserByCustomerModel {
  String? get profileDisplayURL => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  bool? get isFullyVerified => throw _privateConstructorUsedError;

  /// Serializes this SearchUserByCustomerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchUserByCustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUserByCustomerModelCopyWith<SearchUserByCustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserByCustomerModelCopyWith<$Res> {
  factory $SearchUserByCustomerModelCopyWith(SearchUserByCustomerModel value,
          $Res Function(SearchUserByCustomerModel) then) =
      _$SearchUserByCustomerModelCopyWithImpl<$Res, SearchUserByCustomerModel>;
  @useResult
  $Res call(
      {String? profileDisplayURL,
      String? username,
      String? userId,
      bool? isFullyVerified});
}

/// @nodoc
class _$SearchUserByCustomerModelCopyWithImpl<$Res,
        $Val extends SearchUserByCustomerModel>
    implements $SearchUserByCustomerModelCopyWith<$Res> {
  _$SearchUserByCustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUserByCustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileDisplayURL = freezed,
    Object? username = freezed,
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
  }) {
    return _then(_value.copyWith(
      profileDisplayURL: freezed == profileDisplayURL
          ? _value.profileDisplayURL
          : profileDisplayURL // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserByCustomerModelImplCopyWith<$Res>
    implements $SearchUserByCustomerModelCopyWith<$Res> {
  factory _$$SearchUserByCustomerModelImplCopyWith(
          _$SearchUserByCustomerModelImpl value,
          $Res Function(_$SearchUserByCustomerModelImpl) then) =
      __$$SearchUserByCustomerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? profileDisplayURL,
      String? username,
      String? userId,
      bool? isFullyVerified});
}

/// @nodoc
class __$$SearchUserByCustomerModelImplCopyWithImpl<$Res>
    extends _$SearchUserByCustomerModelCopyWithImpl<$Res,
        _$SearchUserByCustomerModelImpl>
    implements _$$SearchUserByCustomerModelImplCopyWith<$Res> {
  __$$SearchUserByCustomerModelImplCopyWithImpl(
      _$SearchUserByCustomerModelImpl _value,
      $Res Function(_$SearchUserByCustomerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchUserByCustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileDisplayURL = freezed,
    Object? username = freezed,
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
  }) {
    return _then(_$SearchUserByCustomerModelImpl(
      profileDisplayURL: freezed == profileDisplayURL
          ? _value.profileDisplayURL
          : profileDisplayURL // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUserByCustomerModelImpl implements _SearchUserByCustomerModel {
  _$SearchUserByCustomerModelImpl(
      {this.profileDisplayURL,
      this.username,
      this.userId,
      this.isFullyVerified});

  factory _$SearchUserByCustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUserByCustomerModelImplFromJson(json);

  @override
  final String? profileDisplayURL;
  @override
  final String? username;
  @override
  final String? userId;
  @override
  final bool? isFullyVerified;

  @override
  String toString() {
    return 'SearchUserByCustomerModel(profileDisplayURL: $profileDisplayURL, username: $username, userId: $userId, isFullyVerified: $isFullyVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserByCustomerModelImpl &&
            (identical(other.profileDisplayURL, profileDisplayURL) ||
                other.profileDisplayURL == profileDisplayURL) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFullyVerified, isFullyVerified) ||
                other.isFullyVerified == isFullyVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, profileDisplayURL, username, userId, isFullyVerified);

  /// Create a copy of SearchUserByCustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserByCustomerModelImplCopyWith<_$SearchUserByCustomerModelImpl>
      get copyWith => __$$SearchUserByCustomerModelImplCopyWithImpl<
          _$SearchUserByCustomerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserByCustomerModelImplToJson(
      this,
    );
  }
}

abstract class _SearchUserByCustomerModel implements SearchUserByCustomerModel {
  factory _SearchUserByCustomerModel(
      {final String? profileDisplayURL,
      final String? username,
      final String? userId,
      final bool? isFullyVerified}) = _$SearchUserByCustomerModelImpl;

  factory _SearchUserByCustomerModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserByCustomerModelImpl.fromJson;

  @override
  String? get profileDisplayURL;
  @override
  String? get username;
  @override
  String? get userId;
  @override
  bool? get isFullyVerified;

  /// Create a copy of SearchUserByCustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserByCustomerModelImplCopyWith<_$SearchUserByCustomerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
