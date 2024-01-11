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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserByCustomerModel _$SearchUserByCustomerModelFromJson(
    Map<String, dynamic> json) {
  return _SearchUserByCustomerModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserByCustomerModel {
  dynamic get profileDisplayURL => throw _privateConstructorUsedError;
  dynamic get username => throw _privateConstructorUsedError;
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get isFullyVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {dynamic profileDisplayURL,
      dynamic username,
      dynamic userId,
      dynamic isFullyVerified});
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
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {dynamic profileDisplayURL,
      dynamic username,
      dynamic userId,
      dynamic isFullyVerified});
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
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$SearchUserByCustomerModelImpl implements _SearchUserByCustomerModel {
  const _$SearchUserByCustomerModelImpl(
      {this.profileDisplayURL,
      this.username,
      this.userId,
      this.isFullyVerified});

  factory _$SearchUserByCustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUserByCustomerModelImplFromJson(json);

  @override
  final dynamic profileDisplayURL;
  @override
  final dynamic username;
  @override
  final dynamic userId;
  @override
  final dynamic isFullyVerified;

  @override
  String toString() {
    return 'SearchUserByCustomerModel(profileDisplayURL: $profileDisplayURL, username: $username, userId: $userId, isFullyVerified: $isFullyVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserByCustomerModelImpl &&
            const DeepCollectionEquality()
                .equals(other.profileDisplayURL, profileDisplayURL) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.isFullyVerified, isFullyVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(profileDisplayURL),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(isFullyVerified));

  @JsonKey(ignore: true)
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
  const factory _SearchUserByCustomerModel(
      {final dynamic profileDisplayURL,
      final dynamic username,
      final dynamic userId,
      final dynamic isFullyVerified}) = _$SearchUserByCustomerModelImpl;

  factory _SearchUserByCustomerModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserByCustomerModelImpl.fromJson;

  @override
  dynamic get profileDisplayURL;
  @override
  dynamic get username;
  @override
  dynamic get userId;
  @override
  dynamic get isFullyVerified;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserByCustomerModelImplCopyWith<_$SearchUserByCustomerModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchUserByCustomerListModel _$SearchUserByCustomerListModelFromJson(
    Map<String, dynamic> json) {
  return _SearchUserByCustomerListModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserByCustomerListModel {
  List<SearchUserByCustomerModel>? get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
  $Res call({List<SearchUserByCustomerModel>? data});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
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
  $Res call({List<SearchUserByCustomerModel>? data});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SearchUserByCustomerListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchUserByCustomerModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SearchUserByCustomerListModelImpl
    implements _SearchUserByCustomerListModel {
  const _$SearchUserByCustomerListModelImpl(
      {final List<SearchUserByCustomerModel>? data})
      : _data = data;

  factory _$SearchUserByCustomerListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchUserByCustomerListModelImplFromJson(json);

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
    return 'SearchUserByCustomerListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserByCustomerListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
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
  const factory _SearchUserByCustomerListModel(
          {final List<SearchUserByCustomerModel>? data}) =
      _$SearchUserByCustomerListModelImpl;

  factory _SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserByCustomerListModelImpl.fromJson;

  @override
  List<SearchUserByCustomerModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserByCustomerListModelImplCopyWith<
          _$SearchUserByCustomerListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
