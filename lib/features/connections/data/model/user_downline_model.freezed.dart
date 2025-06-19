// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_downline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDownlineModel _$UserDownlineModelFromJson(Map<String, dynamic> json) {
  return _UserDownlineModel.fromJson(json);
}

/// @nodoc
mixin _$UserDownlineModel {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get profilePhotoURL => throw _privateConstructorUsedError;

  /// Serializes this UserDownlineModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDownlineModelCopyWith<UserDownlineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDownlineModelCopyWith<$Res> {
  factory $UserDownlineModelCopyWith(
          UserDownlineModel value, $Res Function(UserDownlineModel) then) =
      _$UserDownlineModelCopyWithImpl<$Res, UserDownlineModel>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String userName,
      String profilePhotoURL});
}

/// @nodoc
class _$UserDownlineModelCopyWithImpl<$Res, $Val extends UserDownlineModel>
    implements $UserDownlineModelCopyWith<$Res> {
  _$UserDownlineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? profilePhotoURL = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDownlineModelImplCopyWith<$Res>
    implements $UserDownlineModelCopyWith<$Res> {
  factory _$$UserDownlineModelImplCopyWith(_$UserDownlineModelImpl value,
          $Res Function(_$UserDownlineModelImpl) then) =
      __$$UserDownlineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String userName,
      String profilePhotoURL});
}

/// @nodoc
class __$$UserDownlineModelImplCopyWithImpl<$Res>
    extends _$UserDownlineModelCopyWithImpl<$Res, _$UserDownlineModelImpl>
    implements _$$UserDownlineModelImplCopyWith<$Res> {
  __$$UserDownlineModelImplCopyWithImpl(_$UserDownlineModelImpl _value,
      $Res Function(_$UserDownlineModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? profilePhotoURL = null,
  }) {
    return _then(_$UserDownlineModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDownlineModelImpl implements _UserDownlineModel {
  const _$UserDownlineModelImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.profilePhotoURL});

  factory _$UserDownlineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDownlineModelImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String userName;
  @override
  final String profilePhotoURL;

  @override
  String toString() {
    return 'UserDownlineModel(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, profilePhotoURL: $profilePhotoURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDownlineModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, userName, profilePhotoURL);

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDownlineModelImplCopyWith<_$UserDownlineModelImpl> get copyWith =>
      __$$UserDownlineModelImplCopyWithImpl<_$UserDownlineModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDownlineModelImplToJson(
      this,
    );
  }
}

abstract class _UserDownlineModel implements UserDownlineModel {
  const factory _UserDownlineModel(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String userName,
      required final String profilePhotoURL}) = _$UserDownlineModelImpl;

  factory _UserDownlineModel.fromJson(Map<String, dynamic> json) =
      _$UserDownlineModelImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get userName;
  @override
  String get profilePhotoURL;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDownlineModelImplCopyWith<_$UserDownlineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDownlineListModel _$UserDownlineListModelFromJson(
    Map<String, dynamic> json) {
  return _UserDownlineListModel.fromJson(json);
}

/// @nodoc
mixin _$UserDownlineListModel {
  List<UserDownlineModel> get data => throw _privateConstructorUsedError;

  /// Serializes this UserDownlineListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDownlineListModelCopyWith<UserDownlineListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDownlineListModelCopyWith<$Res> {
  factory $UserDownlineListModelCopyWith(UserDownlineListModel value,
          $Res Function(UserDownlineListModel) then) =
      _$UserDownlineListModelCopyWithImpl<$Res, UserDownlineListModel>;
  @useResult
  $Res call({List<UserDownlineModel> data});
}

/// @nodoc
class _$UserDownlineListModelCopyWithImpl<$Res,
        $Val extends UserDownlineListModel>
    implements $UserDownlineListModelCopyWith<$Res> {
  _$UserDownlineListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDownlineListModel
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
              as List<UserDownlineModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDownlineListModelImplCopyWith<$Res>
    implements $UserDownlineListModelCopyWith<$Res> {
  factory _$$UserDownlineListModelImplCopyWith(
          _$UserDownlineListModelImpl value,
          $Res Function(_$UserDownlineListModelImpl) then) =
      __$$UserDownlineListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserDownlineModel> data});
}

/// @nodoc
class __$$UserDownlineListModelImplCopyWithImpl<$Res>
    extends _$UserDownlineListModelCopyWithImpl<$Res,
        _$UserDownlineListModelImpl>
    implements _$$UserDownlineListModelImplCopyWith<$Res> {
  __$$UserDownlineListModelImplCopyWithImpl(_$UserDownlineListModelImpl _value,
      $Res Function(_$UserDownlineListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserDownlineListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDownlineModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDownlineListModelImpl implements _UserDownlineListModel {
  const _$UserDownlineListModelImpl(
      {required final List<UserDownlineModel> data})
      : _data = data;

  factory _$UserDownlineListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDownlineListModelImplFromJson(json);

  final List<UserDownlineModel> _data;
  @override
  List<UserDownlineModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UserDownlineListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDownlineListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDownlineListModelImplCopyWith<_$UserDownlineListModelImpl>
      get copyWith => __$$UserDownlineListModelImplCopyWithImpl<
          _$UserDownlineListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDownlineListModelImplToJson(
      this,
    );
  }
}

abstract class _UserDownlineListModel implements UserDownlineListModel {
  const factory _UserDownlineListModel(
          {required final List<UserDownlineModel> data}) =
      _$UserDownlineListModelImpl;

  factory _UserDownlineListModel.fromJson(Map<String, dynamic> json) =
      _$UserDownlineListModelImpl.fromJson;

  @override
  List<UserDownlineModel> get data;

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDownlineListModelImplCopyWith<_$UserDownlineListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
