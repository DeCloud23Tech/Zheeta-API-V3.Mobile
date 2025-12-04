// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginUserModel {
  dynamic get token;
  dynamic get refreshToken;
  dynamic get username;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginUserModelCopyWith<LoginUserModel> get copyWith =>
      _$LoginUserModelCopyWithImpl<LoginUserModel>(
          this as LoginUserModel, _$identity);

  /// Serializes this LoginUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginUserModel &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(username));

  @override
  String toString() {
    return 'LoginUserModel(token: $token, refreshToken: $refreshToken, username: $username)';
  }
}

/// @nodoc
abstract mixin class $LoginUserModelCopyWith<$Res> {
  factory $LoginUserModelCopyWith(
          LoginUserModel value, $Res Function(LoginUserModel) _then) =
      _$LoginUserModelCopyWithImpl;
  @useResult
  $Res call({dynamic token, dynamic refreshToken, dynamic username});
}

/// @nodoc
class _$LoginUserModelCopyWithImpl<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  _$LoginUserModelCopyWithImpl(this._self, this._then);

  final LoginUserModel _self;
  final $Res Function(LoginUserModel) _then;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? username = freezed,
  }) {
    return _then(_self.copyWith(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoginUserModel implements LoginUserModel {
  _LoginUserModel({this.token, this.refreshToken, this.username});
  factory _LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);

  @override
  final dynamic token;
  @override
  final dynamic refreshToken;
  @override
  final dynamic username;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginUserModelCopyWith<_LoginUserModel> get copyWith =>
      __$LoginUserModelCopyWithImpl<_LoginUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginUserModel &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(username));

  @override
  String toString() {
    return 'LoginUserModel(token: $token, refreshToken: $refreshToken, username: $username)';
  }
}

/// @nodoc
abstract mixin class _$LoginUserModelCopyWith<$Res>
    implements $LoginUserModelCopyWith<$Res> {
  factory _$LoginUserModelCopyWith(
          _LoginUserModel value, $Res Function(_LoginUserModel) _then) =
      __$LoginUserModelCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic token, dynamic refreshToken, dynamic username});
}

/// @nodoc
class __$LoginUserModelCopyWithImpl<$Res>
    implements _$LoginUserModelCopyWith<$Res> {
  __$LoginUserModelCopyWithImpl(this._self, this._then);

  final _LoginUserModel _self;
  final $Res Function(_LoginUserModel) _then;

  /// Create a copy of LoginUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? username = freezed,
  }) {
    return _then(_LoginUserModel(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
