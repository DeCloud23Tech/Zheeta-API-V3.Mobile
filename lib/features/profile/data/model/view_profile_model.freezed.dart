// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewProfileModel _$ViewProfileModelFromJson(Map<String, dynamic> json) {
  return _ViewProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ViewProfileModel {
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  bool get canMessage => throw _privateConstructorUsedError;
  bool get canAddFriend => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  UserProfileDataModel get profile => throw _privateConstructorUsedError;

  /// Serializes this ViewProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewProfileModelCopyWith<ViewProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewProfileModelCopyWith<$Res> {
  factory $ViewProfileModelCopyWith(
          ViewProfileModel value, $Res Function(ViewProfileModel) then) =
      _$ViewProfileModelCopyWithImpl<$Res, ViewProfileModel>;
  @useResult
  $Res call(
      {bool isFriend,
      bool isBlocked,
      bool canMessage,
      bool canAddFriend,
      double distance,
      UserProfileDataModel profile});

  $UserProfileDataModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$ViewProfileModelCopyWithImpl<$Res, $Val extends ViewProfileModel>
    implements $ViewProfileModelCopyWith<$Res> {
  _$ViewProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isBlocked = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? distance = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ) as $Val);
  }

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res> get profile {
    return $UserProfileDataModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewProfileModelImplCopyWith<$Res>
    implements $ViewProfileModelCopyWith<$Res> {
  factory _$$ViewProfileModelImplCopyWith(_$ViewProfileModelImpl value,
          $Res Function(_$ViewProfileModelImpl) then) =
      __$$ViewProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFriend,
      bool isBlocked,
      bool canMessage,
      bool canAddFriend,
      double distance,
      UserProfileDataModel profile});

  @override
  $UserProfileDataModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ViewProfileModelImplCopyWithImpl<$Res>
    extends _$ViewProfileModelCopyWithImpl<$Res, _$ViewProfileModelImpl>
    implements _$$ViewProfileModelImplCopyWith<$Res> {
  __$$ViewProfileModelImplCopyWithImpl(_$ViewProfileModelImpl _value,
      $Res Function(_$ViewProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isBlocked = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? distance = null,
    Object? profile = null,
  }) {
    return _then(_$ViewProfileModelImpl(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewProfileModelImpl implements _ViewProfileModel {
  _$ViewProfileModelImpl(
      {required this.isFriend,
      required this.isBlocked,
      required this.canMessage,
      required this.canAddFriend,
      required this.distance,
      required this.profile});

  factory _$ViewProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewProfileModelImplFromJson(json);

  @override
  final bool isFriend;
  @override
  final bool isBlocked;
  @override
  final bool canMessage;
  @override
  final bool canAddFriend;
  @override
  final double distance;
  @override
  final UserProfileDataModel profile;

  @override
  String toString() {
    return 'ViewProfileModel(isFriend: $isFriend, isBlocked: $isBlocked, canMessage: $canMessage, canAddFriend: $canAddFriend, distance: $distance, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewProfileModelImpl &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.canMessage, canMessage) ||
                other.canMessage == canMessage) &&
            (identical(other.canAddFriend, canAddFriend) ||
                other.canAddFriend == canAddFriend) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isFriend, isBlocked, canMessage,
      canAddFriend, distance, profile);

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewProfileModelImplCopyWith<_$ViewProfileModelImpl> get copyWith =>
      __$$ViewProfileModelImplCopyWithImpl<_$ViewProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ViewProfileModel implements ViewProfileModel {
  factory _ViewProfileModel(
      {required final bool isFriend,
      required final bool isBlocked,
      required final bool canMessage,
      required final bool canAddFriend,
      required final double distance,
      required final UserProfileDataModel profile}) = _$ViewProfileModelImpl;

  factory _ViewProfileModel.fromJson(Map<String, dynamic> json) =
      _$ViewProfileModelImpl.fromJson;

  @override
  bool get isFriend;
  @override
  bool get isBlocked;
  @override
  bool get canMessage;
  @override
  bool get canAddFriend;
  @override
  double get distance;
  @override
  UserProfileDataModel get profile;

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewProfileModelImplCopyWith<_$ViewProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
