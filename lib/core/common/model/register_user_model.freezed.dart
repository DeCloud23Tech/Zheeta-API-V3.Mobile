// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterUserModel {
  dynamic get phoneCountryCode;
  dynamic get rolesCSV;
  dynamic get createdDate;
  dynamic get lastSeenDate;
  dynamic get isFullyVerified;
  dynamic get isBlocked;
  dynamic get authType;
  dynamic get id;
  dynamic get userName;
  dynamic get normalizedUserName;
  dynamic get email;
  dynamic get normalizedEmail;
  dynamic get emailConfirmed;
  dynamic get passwordHash;
  dynamic get securityStamp;
  dynamic get concurrencyStamp;
  dynamic get phoneNumber;
  dynamic get phoneNumberConfirmed;
  dynamic get twoFactorEnabled;
  dynamic get lockoutEnd;
  dynamic get lockoutEnabled;
  dynamic get accessFailedCount;

  /// Create a copy of RegisterUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterUserModelCopyWith<RegisterUserModel> get copyWith =>
      _$RegisterUserModelCopyWithImpl<RegisterUserModel>(
          this as RegisterUserModel, _$identity);

  /// Serializes this RegisterUserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterUserModel &&
            const DeepCollectionEquality()
                .equals(other.phoneCountryCode, phoneCountryCode) &&
            const DeepCollectionEquality().equals(other.rolesCSV, rolesCSV) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenDate, lastSeenDate) &&
            const DeepCollectionEquality()
                .equals(other.isFullyVerified, isFullyVerified) &&
            const DeepCollectionEquality().equals(other.isBlocked, isBlocked) &&
            const DeepCollectionEquality().equals(other.authType, authType) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.normalizedUserName, normalizedUserName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.normalizedEmail, normalizedEmail) &&
            const DeepCollectionEquality()
                .equals(other.emailConfirmed, emailConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.passwordHash, passwordHash) &&
            const DeepCollectionEquality()
                .equals(other.securityStamp, securityStamp) &&
            const DeepCollectionEquality()
                .equals(other.concurrencyStamp, concurrencyStamp) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberConfirmed, phoneNumberConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.twoFactorEnabled, twoFactorEnabled) &&
            const DeepCollectionEquality()
                .equals(other.lockoutEnd, lockoutEnd) &&
            const DeepCollectionEquality()
                .equals(other.lockoutEnabled, lockoutEnabled) &&
            const DeepCollectionEquality()
                .equals(other.accessFailedCount, accessFailedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(phoneCountryCode),
        const DeepCollectionEquality().hash(rolesCSV),
        const DeepCollectionEquality().hash(createdDate),
        const DeepCollectionEquality().hash(lastSeenDate),
        const DeepCollectionEquality().hash(isFullyVerified),
        const DeepCollectionEquality().hash(isBlocked),
        const DeepCollectionEquality().hash(authType),
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(userName),
        const DeepCollectionEquality().hash(normalizedUserName),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(normalizedEmail),
        const DeepCollectionEquality().hash(emailConfirmed),
        const DeepCollectionEquality().hash(passwordHash),
        const DeepCollectionEquality().hash(securityStamp),
        const DeepCollectionEquality().hash(concurrencyStamp),
        const DeepCollectionEquality().hash(phoneNumber),
        const DeepCollectionEquality().hash(phoneNumberConfirmed),
        const DeepCollectionEquality().hash(twoFactorEnabled),
        const DeepCollectionEquality().hash(lockoutEnd),
        const DeepCollectionEquality().hash(lockoutEnabled),
        const DeepCollectionEquality().hash(accessFailedCount)
      ]);

  @override
  String toString() {
    return 'RegisterUserModel(phoneCountryCode: $phoneCountryCode, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, isFullyVerified: $isFullyVerified, isBlocked: $isBlocked, authType: $authType, id: $id, userName: $userName, normalizedUserName: $normalizedUserName, email: $email, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, passwordHash: $passwordHash, securityStamp: $securityStamp, concurrencyStamp: $concurrencyStamp, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed, twoFactorEnabled: $twoFactorEnabled, lockoutEnd: $lockoutEnd, lockoutEnabled: $lockoutEnabled, accessFailedCount: $accessFailedCount)';
  }
}

/// @nodoc
abstract mixin class $RegisterUserModelCopyWith<$Res> {
  factory $RegisterUserModelCopyWith(
          RegisterUserModel value, $Res Function(RegisterUserModel) _then) =
      _$RegisterUserModelCopyWithImpl;
  @useResult
  $Res call(
      {dynamic phoneCountryCode,
      dynamic rolesCSV,
      dynamic createdDate,
      dynamic lastSeenDate,
      dynamic isFullyVerified,
      dynamic isBlocked,
      dynamic authType,
      dynamic id,
      dynamic userName,
      dynamic normalizedUserName,
      dynamic email,
      dynamic normalizedEmail,
      dynamic emailConfirmed,
      dynamic passwordHash,
      dynamic securityStamp,
      dynamic concurrencyStamp,
      dynamic phoneNumber,
      dynamic phoneNumberConfirmed,
      dynamic twoFactorEnabled,
      dynamic lockoutEnd,
      dynamic lockoutEnabled,
      dynamic accessFailedCount});
}

/// @nodoc
class _$RegisterUserModelCopyWithImpl<$Res>
    implements $RegisterUserModelCopyWith<$Res> {
  _$RegisterUserModelCopyWithImpl(this._self, this._then);

  final RegisterUserModel _self;
  final $Res Function(RegisterUserModel) _then;

  /// Create a copy of RegisterUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneCountryCode = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? lastSeenDate = freezed,
    Object? isFullyVerified = freezed,
    Object? isBlocked = freezed,
    Object? authType = freezed,
    Object? id = freezed,
    Object? userName = freezed,
    Object? normalizedUserName = freezed,
    Object? email = freezed,
    Object? normalizedEmail = freezed,
    Object? emailConfirmed = freezed,
    Object? passwordHash = freezed,
    Object? securityStamp = freezed,
    Object? concurrencyStamp = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberConfirmed = freezed,
    Object? twoFactorEnabled = freezed,
    Object? lockoutEnd = freezed,
    Object? lockoutEnabled = freezed,
    Object? accessFailedCount = freezed,
  }) {
    return _then(_self.copyWith(
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _self.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastSeenDate: freezed == lastSeenDate
          ? _self.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBlocked: freezed == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      authType: freezed == authType
          ? _self.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedUserName: freezed == normalizedUserName
          ? _self.normalizedUserName
          : normalizedUserName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedEmail: freezed == normalizedEmail
          ? _self.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as dynamic,
      securityStamp: freezed == securityStamp
          ? _self.securityStamp
          : securityStamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      concurrencyStamp: freezed == concurrencyStamp
          ? _self.concurrencyStamp
          : concurrencyStamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _self.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      twoFactorEnabled: freezed == twoFactorEnabled
          ? _self.twoFactorEnabled
          : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lockoutEnd: freezed == lockoutEnd
          ? _self.lockoutEnd
          : lockoutEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lockoutEnabled: freezed == lockoutEnabled
          ? _self.lockoutEnabled
          : lockoutEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accessFailedCount: freezed == accessFailedCount
          ? _self.accessFailedCount
          : accessFailedCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RegisterUserModel implements RegisterUserModel {
  _RegisterUserModel(
      {this.phoneCountryCode,
      this.rolesCSV,
      this.createdDate,
      this.lastSeenDate,
      this.isFullyVerified,
      this.isBlocked,
      this.authType,
      this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.accessFailedCount});
  factory _RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserModelFromJson(json);

  @override
  final dynamic phoneCountryCode;
  @override
  final dynamic rolesCSV;
  @override
  final dynamic createdDate;
  @override
  final dynamic lastSeenDate;
  @override
  final dynamic isFullyVerified;
  @override
  final dynamic isBlocked;
  @override
  final dynamic authType;
  @override
  final dynamic id;
  @override
  final dynamic userName;
  @override
  final dynamic normalizedUserName;
  @override
  final dynamic email;
  @override
  final dynamic normalizedEmail;
  @override
  final dynamic emailConfirmed;
  @override
  final dynamic passwordHash;
  @override
  final dynamic securityStamp;
  @override
  final dynamic concurrencyStamp;
  @override
  final dynamic phoneNumber;
  @override
  final dynamic phoneNumberConfirmed;
  @override
  final dynamic twoFactorEnabled;
  @override
  final dynamic lockoutEnd;
  @override
  final dynamic lockoutEnabled;
  @override
  final dynamic accessFailedCount;

  /// Create a copy of RegisterUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterUserModelCopyWith<_RegisterUserModel> get copyWith =>
      __$RegisterUserModelCopyWithImpl<_RegisterUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterUserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterUserModel &&
            const DeepCollectionEquality()
                .equals(other.phoneCountryCode, phoneCountryCode) &&
            const DeepCollectionEquality().equals(other.rolesCSV, rolesCSV) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenDate, lastSeenDate) &&
            const DeepCollectionEquality()
                .equals(other.isFullyVerified, isFullyVerified) &&
            const DeepCollectionEquality().equals(other.isBlocked, isBlocked) &&
            const DeepCollectionEquality().equals(other.authType, authType) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.normalizedUserName, normalizedUserName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.normalizedEmail, normalizedEmail) &&
            const DeepCollectionEquality()
                .equals(other.emailConfirmed, emailConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.passwordHash, passwordHash) &&
            const DeepCollectionEquality()
                .equals(other.securityStamp, securityStamp) &&
            const DeepCollectionEquality()
                .equals(other.concurrencyStamp, concurrencyStamp) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberConfirmed, phoneNumberConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.twoFactorEnabled, twoFactorEnabled) &&
            const DeepCollectionEquality()
                .equals(other.lockoutEnd, lockoutEnd) &&
            const DeepCollectionEquality()
                .equals(other.lockoutEnabled, lockoutEnabled) &&
            const DeepCollectionEquality()
                .equals(other.accessFailedCount, accessFailedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(phoneCountryCode),
        const DeepCollectionEquality().hash(rolesCSV),
        const DeepCollectionEquality().hash(createdDate),
        const DeepCollectionEquality().hash(lastSeenDate),
        const DeepCollectionEquality().hash(isFullyVerified),
        const DeepCollectionEquality().hash(isBlocked),
        const DeepCollectionEquality().hash(authType),
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(userName),
        const DeepCollectionEquality().hash(normalizedUserName),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(normalizedEmail),
        const DeepCollectionEquality().hash(emailConfirmed),
        const DeepCollectionEquality().hash(passwordHash),
        const DeepCollectionEquality().hash(securityStamp),
        const DeepCollectionEquality().hash(concurrencyStamp),
        const DeepCollectionEquality().hash(phoneNumber),
        const DeepCollectionEquality().hash(phoneNumberConfirmed),
        const DeepCollectionEquality().hash(twoFactorEnabled),
        const DeepCollectionEquality().hash(lockoutEnd),
        const DeepCollectionEquality().hash(lockoutEnabled),
        const DeepCollectionEquality().hash(accessFailedCount)
      ]);

  @override
  String toString() {
    return 'RegisterUserModel(phoneCountryCode: $phoneCountryCode, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, isFullyVerified: $isFullyVerified, isBlocked: $isBlocked, authType: $authType, id: $id, userName: $userName, normalizedUserName: $normalizedUserName, email: $email, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, passwordHash: $passwordHash, securityStamp: $securityStamp, concurrencyStamp: $concurrencyStamp, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed, twoFactorEnabled: $twoFactorEnabled, lockoutEnd: $lockoutEnd, lockoutEnabled: $lockoutEnabled, accessFailedCount: $accessFailedCount)';
  }
}

/// @nodoc
abstract mixin class _$RegisterUserModelCopyWith<$Res>
    implements $RegisterUserModelCopyWith<$Res> {
  factory _$RegisterUserModelCopyWith(
          _RegisterUserModel value, $Res Function(_RegisterUserModel) _then) =
      __$RegisterUserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {dynamic phoneCountryCode,
      dynamic rolesCSV,
      dynamic createdDate,
      dynamic lastSeenDate,
      dynamic isFullyVerified,
      dynamic isBlocked,
      dynamic authType,
      dynamic id,
      dynamic userName,
      dynamic normalizedUserName,
      dynamic email,
      dynamic normalizedEmail,
      dynamic emailConfirmed,
      dynamic passwordHash,
      dynamic securityStamp,
      dynamic concurrencyStamp,
      dynamic phoneNumber,
      dynamic phoneNumberConfirmed,
      dynamic twoFactorEnabled,
      dynamic lockoutEnd,
      dynamic lockoutEnabled,
      dynamic accessFailedCount});
}

/// @nodoc
class __$RegisterUserModelCopyWithImpl<$Res>
    implements _$RegisterUserModelCopyWith<$Res> {
  __$RegisterUserModelCopyWithImpl(this._self, this._then);

  final _RegisterUserModel _self;
  final $Res Function(_RegisterUserModel) _then;

  /// Create a copy of RegisterUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneCountryCode = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? lastSeenDate = freezed,
    Object? isFullyVerified = freezed,
    Object? isBlocked = freezed,
    Object? authType = freezed,
    Object? id = freezed,
    Object? userName = freezed,
    Object? normalizedUserName = freezed,
    Object? email = freezed,
    Object? normalizedEmail = freezed,
    Object? emailConfirmed = freezed,
    Object? passwordHash = freezed,
    Object? securityStamp = freezed,
    Object? concurrencyStamp = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberConfirmed = freezed,
    Object? twoFactorEnabled = freezed,
    Object? lockoutEnd = freezed,
    Object? lockoutEnabled = freezed,
    Object? accessFailedCount = freezed,
  }) {
    return _then(_RegisterUserModel(
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _self.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastSeenDate: freezed == lastSeenDate
          ? _self.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBlocked: freezed == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      authType: freezed == authType
          ? _self.authType
          : authType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedUserName: freezed == normalizedUserName
          ? _self.normalizedUserName
          : normalizedUserName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedEmail: freezed == normalizedEmail
          ? _self.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as dynamic,
      securityStamp: freezed == securityStamp
          ? _self.securityStamp
          : securityStamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      concurrencyStamp: freezed == concurrencyStamp
          ? _self.concurrencyStamp
          : concurrencyStamp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _self.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      twoFactorEnabled: freezed == twoFactorEnabled
          ? _self.twoFactorEnabled
          : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lockoutEnd: freezed == lockoutEnd
          ? _self.lockoutEnd
          : lockoutEnd // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lockoutEnabled: freezed == lockoutEnabled
          ? _self.lockoutEnabled
          : lockoutEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accessFailedCount: freezed == accessFailedCount
          ? _self.accessFailedCount
          : accessFailedCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
