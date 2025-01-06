// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPostModel _$UserPostModelFromJson(Map<String, dynamic> json) {
  return _UserPostModel.fromJson(json);
}

/// @nodoc
mixin _$UserPostModel {
  dynamic get mediaCollectionURL => throw _privateConstructorUsedError;

  /// Serializes this UserPostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPostModelCopyWith<UserPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostModelCopyWith<$Res> {
  factory $UserPostModelCopyWith(
          UserPostModel value, $Res Function(UserPostModel) then) =
      _$UserPostModelCopyWithImpl<$Res, UserPostModel>;
  @useResult
  $Res call({dynamic mediaCollectionURL});
}

/// @nodoc
class _$UserPostModelCopyWithImpl<$Res, $Val extends UserPostModel>
    implements $UserPostModelCopyWith<$Res> {
  _$UserPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaCollectionURL = freezed,
  }) {
    return _then(_value.copyWith(
      mediaCollectionURL: freezed == mediaCollectionURL
          ? _value.mediaCollectionURL
          : mediaCollectionURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostModelImplCopyWith<$Res>
    implements $UserPostModelCopyWith<$Res> {
  factory _$$UserPostModelImplCopyWith(
          _$UserPostModelImpl value, $Res Function(_$UserPostModelImpl) then) =
      __$$UserPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic mediaCollectionURL});
}

/// @nodoc
class __$$UserPostModelImplCopyWithImpl<$Res>
    extends _$UserPostModelCopyWithImpl<$Res, _$UserPostModelImpl>
    implements _$$UserPostModelImplCopyWith<$Res> {
  __$$UserPostModelImplCopyWithImpl(
      _$UserPostModelImpl _value, $Res Function(_$UserPostModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaCollectionURL = freezed,
  }) {
    return _then(_$UserPostModelImpl(
      mediaCollectionURL: freezed == mediaCollectionURL
          ? _value.mediaCollectionURL
          : mediaCollectionURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPostModelImpl implements _UserPostModel {
  _$UserPostModelImpl({this.mediaCollectionURL});

  factory _$UserPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPostModelImplFromJson(json);

  @override
  final dynamic mediaCollectionURL;

  @override
  String toString() {
    return 'UserPostModel(mediaCollectionURL: $mediaCollectionURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostModelImpl &&
            const DeepCollectionEquality()
                .equals(other.mediaCollectionURL, mediaCollectionURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(mediaCollectionURL));

  /// Create a copy of UserPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostModelImplCopyWith<_$UserPostModelImpl> get copyWith =>
      __$$UserPostModelImplCopyWithImpl<_$UserPostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPostModelImplToJson(
      this,
    );
  }
}

abstract class _UserPostModel implements UserPostModel {
  factory _UserPostModel({final dynamic mediaCollectionURL}) =
      _$UserPostModelImpl;

  factory _UserPostModel.fromJson(Map<String, dynamic> json) =
      _$UserPostModelImpl.fromJson;

  @override
  dynamic get mediaCollectionURL;

  /// Create a copy of UserPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPostModelImplCopyWith<_$UserPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPostListModel _$UserPostListModelFromJson(Map<String, dynamic> json) {
  return _UserPostListModel.fromJson(json);
}

/// @nodoc
mixin _$UserPostListModel {
  List<UserPostModel> get data => throw _privateConstructorUsedError;

  /// Serializes this UserPostListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPostListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPostListModelCopyWith<UserPostListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostListModelCopyWith<$Res> {
  factory $UserPostListModelCopyWith(
          UserPostListModel value, $Res Function(UserPostListModel) then) =
      _$UserPostListModelCopyWithImpl<$Res, UserPostListModel>;
  @useResult
  $Res call({List<UserPostModel> data});
}

/// @nodoc
class _$UserPostListModelCopyWithImpl<$Res, $Val extends UserPostListModel>
    implements $UserPostListModelCopyWith<$Res> {
  _$UserPostListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPostListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserPostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostListModelImplCopyWith<$Res>
    implements $UserPostListModelCopyWith<$Res> {
  factory _$$UserPostListModelImplCopyWith(_$UserPostListModelImpl value,
          $Res Function(_$UserPostListModelImpl) then) =
      __$$UserPostListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserPostModel> data});
}

/// @nodoc
class __$$UserPostListModelImplCopyWithImpl<$Res>
    extends _$UserPostListModelCopyWithImpl<$Res, _$UserPostListModelImpl>
    implements _$$UserPostListModelImplCopyWith<$Res> {
  __$$UserPostListModelImplCopyWithImpl(_$UserPostListModelImpl _value,
      $Res Function(_$UserPostListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPostListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserPostListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserPostModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPostListModelImpl implements _UserPostListModel {
  _$UserPostListModelImpl({required final List<UserPostModel> data})
      : _data = data;

  factory _$UserPostListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPostListModelImplFromJson(json);

  final List<UserPostModel> _data;
  @override
  List<UserPostModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UserPostListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of UserPostListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostListModelImplCopyWith<_$UserPostListModelImpl> get copyWith =>
      __$$UserPostListModelImplCopyWithImpl<_$UserPostListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPostListModelImplToJson(
      this,
    );
  }
}

abstract class _UserPostListModel implements UserPostListModel {
  factory _UserPostListModel({required final List<UserPostModel> data}) =
      _$UserPostListModelImpl;

  factory _UserPostListModel.fromJson(Map<String, dynamic> json) =
      _$UserPostListModelImpl.fromJson;

  @override
  List<UserPostModel> get data;

  /// Create a copy of UserPostListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPostListModelImplCopyWith<_$UserPostListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
