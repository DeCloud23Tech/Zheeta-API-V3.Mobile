// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_by_customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchUserByCustomerListModel {
  int? get statusCode;
  String? get message;
  bool? get success;
  int? get totalCount;
  List<SearchUserByCustomer>? get data;

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchUserByCustomerListModelCopyWith<SearchUserByCustomerListModel>
      get copyWith => _$SearchUserByCustomerListModelCopyWithImpl<
              SearchUserByCustomerListModel>(
          this as SearchUserByCustomerListModel, _$identity);

  /// Serializes this SearchUserByCustomerListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchUserByCustomerListModel &&
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
    return 'SearchUserByCustomerListModel(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SearchUserByCustomerListModelCopyWith<$Res> {
  factory $SearchUserByCustomerListModelCopyWith(
          SearchUserByCustomerListModel value,
          $Res Function(SearchUserByCustomerListModel) _then) =
      _$SearchUserByCustomerListModelCopyWithImpl;
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      bool? success,
      int? totalCount,
      List<SearchUserByCustomer>? data});
}

/// @nodoc
class _$SearchUserByCustomerListModelCopyWithImpl<$Res>
    implements $SearchUserByCustomerListModelCopyWith<$Res> {
  _$SearchUserByCustomerListModelCopyWithImpl(this._self, this._then);

  final SearchUserByCustomerListModel _self;
  final $Res Function(SearchUserByCustomerListModel) _then;

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
    return _then(_self.copyWith(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUserByCustomer>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchUserByCustomerListModel implements SearchUserByCustomerListModel {
  _SearchUserByCustomerListModel(
      {this.statusCode,
      this.message,
      this.success,
      this.totalCount,
      final List<SearchUserByCustomer>? data})
      : _data = data;
  factory _SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerListModelFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? message;
  @override
  final bool? success;
  @override
  final int? totalCount;
  final List<SearchUserByCustomer>? _data;
  @override
  List<SearchUserByCustomer>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchUserByCustomerListModelCopyWith<_SearchUserByCustomerListModel>
      get copyWith => __$SearchUserByCustomerListModelCopyWithImpl<
          _SearchUserByCustomerListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchUserByCustomerListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchUserByCustomerListModel &&
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
    return 'SearchUserByCustomerListModel(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SearchUserByCustomerListModelCopyWith<$Res>
    implements $SearchUserByCustomerListModelCopyWith<$Res> {
  factory _$SearchUserByCustomerListModelCopyWith(
          _SearchUserByCustomerListModel value,
          $Res Function(_SearchUserByCustomerListModel) _then) =
      __$SearchUserByCustomerListModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? statusCode,
      String? message,
      bool? success,
      int? totalCount,
      List<SearchUserByCustomer>? data});
}

/// @nodoc
class __$SearchUserByCustomerListModelCopyWithImpl<$Res>
    implements _$SearchUserByCustomerListModelCopyWith<$Res> {
  __$SearchUserByCustomerListModelCopyWithImpl(this._self, this._then);

  final _SearchUserByCustomerListModel _self;
  final $Res Function(_SearchUserByCustomerListModel) _then;

  /// Create a copy of SearchUserByCustomerListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? success = freezed,
    Object? totalCount = freezed,
    Object? data = freezed,
  }) {
    return _then(_SearchUserByCustomerListModel(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUserByCustomer>?,
    ));
  }
}

/// @nodoc
mixin _$SearchUserByCustomer {
  String? get profileDisplayURL;
  String? get username;
  String? get userId;
  bool? get isFullyVerified;

  /// Create a copy of SearchUserByCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchUserByCustomerCopyWith<SearchUserByCustomer> get copyWith =>
      _$SearchUserByCustomerCopyWithImpl<SearchUserByCustomer>(
          this as SearchUserByCustomer, _$identity);

  /// Serializes this SearchUserByCustomer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchUserByCustomer &&
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

  @override
  String toString() {
    return 'SearchUserByCustomer(profileDisplayURL: $profileDisplayURL, username: $username, userId: $userId, isFullyVerified: $isFullyVerified)';
  }
}

/// @nodoc
abstract mixin class $SearchUserByCustomerCopyWith<$Res> {
  factory $SearchUserByCustomerCopyWith(SearchUserByCustomer value,
          $Res Function(SearchUserByCustomer) _then) =
      _$SearchUserByCustomerCopyWithImpl;
  @useResult
  $Res call(
      {String? profileDisplayURL,
      String? username,
      String? userId,
      bool? isFullyVerified});
}

/// @nodoc
class _$SearchUserByCustomerCopyWithImpl<$Res>
    implements $SearchUserByCustomerCopyWith<$Res> {
  _$SearchUserByCustomerCopyWithImpl(this._self, this._then);

  final SearchUserByCustomer _self;
  final $Res Function(SearchUserByCustomer) _then;

  /// Create a copy of SearchUserByCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileDisplayURL = freezed,
    Object? username = freezed,
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
  }) {
    return _then(_self.copyWith(
      profileDisplayURL: freezed == profileDisplayURL
          ? _self.profileDisplayURL
          : profileDisplayURL // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SearchUserByCustomer implements SearchUserByCustomer {
  _SearchUserByCustomer(
      {this.profileDisplayURL,
      this.username,
      this.userId,
      this.isFullyVerified});
  factory _SearchUserByCustomer.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerFromJson(json);

  @override
  final String? profileDisplayURL;
  @override
  final String? username;
  @override
  final String? userId;
  @override
  final bool? isFullyVerified;

  /// Create a copy of SearchUserByCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchUserByCustomerCopyWith<_SearchUserByCustomer> get copyWith =>
      __$SearchUserByCustomerCopyWithImpl<_SearchUserByCustomer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchUserByCustomerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchUserByCustomer &&
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

  @override
  String toString() {
    return 'SearchUserByCustomer(profileDisplayURL: $profileDisplayURL, username: $username, userId: $userId, isFullyVerified: $isFullyVerified)';
  }
}

/// @nodoc
abstract mixin class _$SearchUserByCustomerCopyWith<$Res>
    implements $SearchUserByCustomerCopyWith<$Res> {
  factory _$SearchUserByCustomerCopyWith(_SearchUserByCustomer value,
          $Res Function(_SearchUserByCustomer) _then) =
      __$SearchUserByCustomerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? profileDisplayURL,
      String? username,
      String? userId,
      bool? isFullyVerified});
}

/// @nodoc
class __$SearchUserByCustomerCopyWithImpl<$Res>
    implements _$SearchUserByCustomerCopyWith<$Res> {
  __$SearchUserByCustomerCopyWithImpl(this._self, this._then);

  final _SearchUserByCustomer _self;
  final $Res Function(_SearchUserByCustomer) _then;

  /// Create a copy of SearchUserByCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileDisplayURL = freezed,
    Object? username = freezed,
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
  }) {
    return _then(_SearchUserByCustomer(
      profileDisplayURL: freezed == profileDisplayURL
          ? _self.profileDisplayURL
          : profileDisplayURL // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
