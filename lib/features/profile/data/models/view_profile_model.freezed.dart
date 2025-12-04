// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewProfileModel {
  bool get isFriend;
  bool get isBlocked;
  bool get canMessage;
  bool get canAddFriend;
  double get distance;
  UserProfileDataModel get profile;

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewProfileModelCopyWith<ViewProfileModel> get copyWith =>
      _$ViewProfileModelCopyWithImpl<ViewProfileModel>(
          this as ViewProfileModel, _$identity);

  /// Serializes this ViewProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewProfileModel &&
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

  @override
  String toString() {
    return 'ViewProfileModel(isFriend: $isFriend, isBlocked: $isBlocked, canMessage: $canMessage, canAddFriend: $canAddFriend, distance: $distance, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class $ViewProfileModelCopyWith<$Res> {
  factory $ViewProfileModelCopyWith(
          ViewProfileModel value, $Res Function(ViewProfileModel) _then) =
      _$ViewProfileModelCopyWithImpl;
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
class _$ViewProfileModelCopyWithImpl<$Res>
    implements $ViewProfileModelCopyWith<$Res> {
  _$ViewProfileModelCopyWithImpl(this._self, this._then);

  final ViewProfileModel _self;
  final $Res Function(ViewProfileModel) _then;

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
    return _then(_self.copyWith(
      isFriend: null == isFriend
          ? _self.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _self.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _self.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res> get profile {
    return $UserProfileDataModelCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ViewProfileModel implements ViewProfileModel {
  _ViewProfileModel(
      {required this.isFriend,
      required this.isBlocked,
      required this.canMessage,
      required this.canAddFriend,
      required this.distance,
      required this.profile});
  factory _ViewProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ViewProfileModelFromJson(json);

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

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ViewProfileModelCopyWith<_ViewProfileModel> get copyWith =>
      __$ViewProfileModelCopyWithImpl<_ViewProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ViewProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewProfileModel &&
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

  @override
  String toString() {
    return 'ViewProfileModel(isFriend: $isFriend, isBlocked: $isBlocked, canMessage: $canMessage, canAddFriend: $canAddFriend, distance: $distance, profile: $profile)';
  }
}

/// @nodoc
abstract mixin class _$ViewProfileModelCopyWith<$Res>
    implements $ViewProfileModelCopyWith<$Res> {
  factory _$ViewProfileModelCopyWith(
          _ViewProfileModel value, $Res Function(_ViewProfileModel) _then) =
      __$ViewProfileModelCopyWithImpl;
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
class __$ViewProfileModelCopyWithImpl<$Res>
    implements _$ViewProfileModelCopyWith<$Res> {
  __$ViewProfileModelCopyWithImpl(this._self, this._then);

  final _ViewProfileModel _self;
  final $Res Function(_ViewProfileModel) _then;

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFriend = null,
    Object? isBlocked = null,
    Object? canMessage = null,
    Object? canAddFriend = null,
    Object? distance = null,
    Object? profile = null,
  }) {
    return _then(_ViewProfileModel(
      isFriend: null == isFriend
          ? _self.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      canMessage: null == canMessage
          ? _self.canMessage
          : canMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      canAddFriend: null == canAddFriend
          ? _self.canAddFriend
          : canAddFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }

  /// Create a copy of ViewProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res> get profile {
    return $UserProfileDataModelCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
