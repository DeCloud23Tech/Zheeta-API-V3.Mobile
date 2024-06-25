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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewProfileModel _$ViewProfileModelFromJson(Map<String, dynamic> json) {
  return _ViewProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ViewProfileModel {
  bool get canViewProfile => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  bool get canMessage => throw _privateConstructorUsedError;
  bool get canAddFriend => throw _privateConstructorUsedError;
  UserProfileDataModel get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {bool canViewProfile,
      bool isFriend,
      bool canMessage,
      bool canAddFriend,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canViewProfile = null,
    Object? isFriend = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      canViewProfile: null == canViewProfile
          ? _value.canViewProfile
          : canViewProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ) as $Val);
  }

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
      {bool canViewProfile,
      bool isFriend,
      bool canMessage,
      bool canAddFriend,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canViewProfile = null,
    Object? isFriend = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? profile = null,
  }) {
    return _then(_$ViewProfileModelImpl(
      canViewProfile: null == canViewProfile
          ? _value.canViewProfile
          : canViewProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ViewProfileModelImpl implements _ViewProfileModel {
  _$ViewProfileModelImpl(
      {required this.canViewProfile,
      required this.isFriend,
      required this.canMessage,
      required this.canAddFriend,
      required this.profile});

  factory _$ViewProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewProfileModelImplFromJson(json);

  @override
  final bool canViewProfile;
  @override
  final bool isFriend;
  @override
  final bool canMessage;
  @override
  final bool canAddFriend;
  @override
  final UserProfileDataModel profile;

  @override
  String toString() {
    return 'ViewProfileModel(canViewProfile: $canViewProfile, isFriend: $isFriend, canMessage: $canMessage, canAddFriend: $canAddFriend, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewProfileModelImpl &&
            (identical(other.canViewProfile, canViewProfile) ||
                other.canViewProfile == canViewProfile) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.canMessage, canMessage) ||
                other.canMessage == canMessage) &&
            (identical(other.canAddFriend, canAddFriend) ||
                other.canAddFriend == canAddFriend) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, canViewProfile, isFriend, canMessage, canAddFriend, profile);

  @JsonKey(ignore: true)
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
      {required final bool canViewProfile,
      required final bool isFriend,
      required final bool canMessage,
      required final bool canAddFriend,
      required final UserProfileDataModel profile}) = _$ViewProfileModelImpl;

  factory _ViewProfileModel.fromJson(Map<String, dynamic> json) =
      _$ViewProfileModelImpl.fromJson;

  @override
  bool get canViewProfile;
  @override
  bool get isFriend;
  @override
  bool get canMessage;
  @override
  bool get canAddFriend;
  @override
  UserProfileDataModel get profile;
  @override
  @JsonKey(ignore: true)
  _$$ViewProfileModelImplCopyWith<_$ViewProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ViewProfileModelData _$ViewProfileModelDataFromJson(Map<String, dynamic> json) {
  return _ViewProfileModelData.fromJson(json);
}

/// @nodoc
mixin _$ViewProfileModelData {
  bool get canViewProfile => throw _privateConstructorUsedError;
  bool get isFriend => throw _privateConstructorUsedError;
  bool get canMessage => throw _privateConstructorUsedError;
  bool get canAddFriend => throw _privateConstructorUsedError;
  UserProfileDataModel get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewProfileModelDataCopyWith<ViewProfileModelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewProfileModelDataCopyWith<$Res> {
  factory $ViewProfileModelDataCopyWith(ViewProfileModelData value,
          $Res Function(ViewProfileModelData) then) =
      _$ViewProfileModelDataCopyWithImpl<$Res, ViewProfileModelData>;
  @useResult
  $Res call(
      {bool canViewProfile,
      bool isFriend,
      bool canMessage,
      bool canAddFriend,
      UserProfileDataModel profile});

  $UserProfileDataModelCopyWith<$Res> get profile;
}

/// @nodoc
class _$ViewProfileModelDataCopyWithImpl<$Res,
        $Val extends ViewProfileModelData>
    implements $ViewProfileModelDataCopyWith<$Res> {
  _$ViewProfileModelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canViewProfile = null,
    Object? isFriend = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      canViewProfile: null == canViewProfile
          ? _value.canViewProfile
          : canViewProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res> get profile {
    return $UserProfileDataModelCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewProfileModelDataImplCopyWith<$Res>
    implements $ViewProfileModelDataCopyWith<$Res> {
  factory _$$ViewProfileModelDataImplCopyWith(_$ViewProfileModelDataImpl value,
          $Res Function(_$ViewProfileModelDataImpl) then) =
      __$$ViewProfileModelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool canViewProfile,
      bool isFriend,
      bool canMessage,
      bool canAddFriend,
      UserProfileDataModel profile});

  @override
  $UserProfileDataModelCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ViewProfileModelDataImplCopyWithImpl<$Res>
    extends _$ViewProfileModelDataCopyWithImpl<$Res, _$ViewProfileModelDataImpl>
    implements _$$ViewProfileModelDataImplCopyWith<$Res> {
  __$$ViewProfileModelDataImplCopyWithImpl(_$ViewProfileModelDataImpl _value,
      $Res Function(_$ViewProfileModelDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canViewProfile = null,
    Object? isFriend = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? profile = null,
  }) {
    return _then(_$ViewProfileModelDataImpl(
      canViewProfile: null == canViewProfile
          ? _value.canViewProfile
          : canViewProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _value.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _value.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ViewProfileModelDataImpl implements _ViewProfileModelData {
  _$ViewProfileModelDataImpl(
      {required this.canViewProfile,
      required this.isFriend,
      required this.canMessage,
      required this.canAddFriend,
      required this.profile});

  factory _$ViewProfileModelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewProfileModelDataImplFromJson(json);

  @override
  final bool canViewProfile;
  @override
  final bool isFriend;
  @override
  final bool canMessage;
  @override
  final bool canAddFriend;
  @override
  final UserProfileDataModel profile;

  @override
  String toString() {
    return 'ViewProfileModelData(canViewProfile: $canViewProfile, isFriend: $isFriend, canMessage: $canMessage, canAddFriend: $canAddFriend, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewProfileModelDataImpl &&
            (identical(other.canViewProfile, canViewProfile) ||
                other.canViewProfile == canViewProfile) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.canMessage, canMessage) ||
                other.canMessage == canMessage) &&
            (identical(other.canAddFriend, canAddFriend) ||
                other.canAddFriend == canAddFriend) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, canViewProfile, isFriend, canMessage, canAddFriend, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewProfileModelDataImplCopyWith<_$ViewProfileModelDataImpl>
      get copyWith =>
          __$$ViewProfileModelDataImplCopyWithImpl<_$ViewProfileModelDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewProfileModelDataImplToJson(
      this,
    );
  }
}

abstract class _ViewProfileModelData implements ViewProfileModelData {
  factory _ViewProfileModelData(
          {required final bool canViewProfile,
          required final bool isFriend,
          required final bool canMessage,
          required final bool canAddFriend,
          required final UserProfileDataModel profile}) =
      _$ViewProfileModelDataImpl;

  factory _ViewProfileModelData.fromJson(Map<String, dynamic> json) =
      _$ViewProfileModelDataImpl.fromJson;

  @override
  bool get canViewProfile;
  @override
  bool get isFriend;
  @override
  bool get canMessage;
  @override
  bool get canAddFriend;
  @override
  UserProfileDataModel get profile;
  @override
  @JsonKey(ignore: true)
  _$$ViewProfileModelDataImplCopyWith<_$ViewProfileModelDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
