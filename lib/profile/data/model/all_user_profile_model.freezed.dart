// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AllUserProfileModel _$AllUserProfileModelFromJson(Map<String, dynamic> json) {
  return _AllUserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$AllUserProfileModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get userName => throw _privateConstructorUsedError;
  dynamic get isFullyVerified => throw _privateConstructorUsedError;
  dynamic get firstName => throw _privateConstructorUsedError;
  dynamic get lastName => throw _privateConstructorUsedError;
  dynamic get rolesCSV => throw _privateConstructorUsedError;
  dynamic get createdDate => throw _privateConstructorUsedError;
  ResidentialAddressModel? get residentialAddress =>
      throw _privateConstructorUsedError;
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  dynamic get email => throw _privateConstructorUsedError;
  dynamic get isBlocked => throw _privateConstructorUsedError;
  dynamic get subscriptionPlan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllUserProfileModelCopyWith<AllUserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllUserProfileModelCopyWith<$Res> {
  factory $AllUserProfileModelCopyWith(
          AllUserProfileModel value, $Res Function(AllUserProfileModel) then) =
      _$AllUserProfileModelCopyWithImpl<$Res, AllUserProfileModel>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic isFullyVerified,
      dynamic firstName,
      dynamic lastName,
      dynamic rolesCSV,
      dynamic createdDate,
      ResidentialAddressModel? residentialAddress,
      dynamic phoneNumber,
      dynamic email,
      dynamic isBlocked,
      dynamic subscriptionPlan});

  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
}

/// @nodoc
class _$AllUserProfileModelCopyWithImpl<$Res, $Val extends AllUserProfileModel>
    implements $AllUserProfileModelCopyWith<$Res> {
  _$AllUserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? isFullyVerified = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? residentialAddress = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? isBlocked = freezed,
    Object? subscriptionPlan = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _value.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress {
    if (_value.residentialAddress == null) {
      return null;
    }

    return $ResidentialAddressModelCopyWith<$Res>(_value.residentialAddress!,
        (value) {
      return _then(_value.copyWith(residentialAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AllUserProfileModelImplCopyWith<$Res>
    implements $AllUserProfileModelCopyWith<$Res> {
  factory _$$AllUserProfileModelImplCopyWith(_$AllUserProfileModelImpl value,
          $Res Function(_$AllUserProfileModelImpl) then) =
      __$$AllUserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic isFullyVerified,
      dynamic firstName,
      dynamic lastName,
      dynamic rolesCSV,
      dynamic createdDate,
      ResidentialAddressModel? residentialAddress,
      dynamic phoneNumber,
      dynamic email,
      dynamic isBlocked,
      dynamic subscriptionPlan});

  @override
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
}

/// @nodoc
class __$$AllUserProfileModelImplCopyWithImpl<$Res>
    extends _$AllUserProfileModelCopyWithImpl<$Res, _$AllUserProfileModelImpl>
    implements _$$AllUserProfileModelImplCopyWith<$Res> {
  __$$AllUserProfileModelImplCopyWithImpl(_$AllUserProfileModelImpl _value,
      $Res Function(_$AllUserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? isFullyVerified = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? residentialAddress = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? isBlocked = freezed,
    Object? subscriptionPlan = freezed,
  }) {
    return _then(_$AllUserProfileModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _value.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$AllUserProfileModelImpl implements _AllUserProfileModel {
  const _$AllUserProfileModelImpl(
      {this.userId,
      this.userName,
      this.isFullyVerified,
      this.firstName,
      this.lastName,
      this.rolesCSV,
      this.createdDate,
      this.residentialAddress,
      this.phoneNumber,
      this.email,
      this.isBlocked,
      this.subscriptionPlan});

  factory _$AllUserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllUserProfileModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic userName;
  @override
  final dynamic isFullyVerified;
  @override
  final dynamic firstName;
  @override
  final dynamic lastName;
  @override
  final dynamic rolesCSV;
  @override
  final dynamic createdDate;
  @override
  final ResidentialAddressModel? residentialAddress;
  @override
  final dynamic phoneNumber;
  @override
  final dynamic email;
  @override
  final dynamic isBlocked;
  @override
  final dynamic subscriptionPlan;

  @override
  String toString() {
    return 'AllUserProfileModel(userId: $userId, userName: $userName, isFullyVerified: $isFullyVerified, firstName: $firstName, lastName: $lastName, rolesCSV: $rolesCSV, createdDate: $createdDate, residentialAddress: $residentialAddress, phoneNumber: $phoneNumber, email: $email, isBlocked: $isBlocked, subscriptionPlan: $subscriptionPlan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllUserProfileModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.isFullyVerified, isFullyVerified) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.rolesCSV, rolesCSV) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            (identical(other.residentialAddress, residentialAddress) ||
                other.residentialAddress == residentialAddress) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.isBlocked, isBlocked) &&
            const DeepCollectionEquality()
                .equals(other.subscriptionPlan, subscriptionPlan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(isFullyVerified),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(rolesCSV),
      const DeepCollectionEquality().hash(createdDate),
      residentialAddress,
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isBlocked),
      const DeepCollectionEquality().hash(subscriptionPlan));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllUserProfileModelImplCopyWith<_$AllUserProfileModelImpl> get copyWith =>
      __$$AllUserProfileModelImplCopyWithImpl<_$AllUserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllUserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _AllUserProfileModel implements AllUserProfileModel {
  const factory _AllUserProfileModel(
      {final dynamic userId,
      final dynamic userName,
      final dynamic isFullyVerified,
      final dynamic firstName,
      final dynamic lastName,
      final dynamic rolesCSV,
      final dynamic createdDate,
      final ResidentialAddressModel? residentialAddress,
      final dynamic phoneNumber,
      final dynamic email,
      final dynamic isBlocked,
      final dynamic subscriptionPlan}) = _$AllUserProfileModelImpl;

  factory _AllUserProfileModel.fromJson(Map<String, dynamic> json) =
      _$AllUserProfileModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get userName;
  @override
  dynamic get isFullyVerified;
  @override
  dynamic get firstName;
  @override
  dynamic get lastName;
  @override
  dynamic get rolesCSV;
  @override
  dynamic get createdDate;
  @override
  ResidentialAddressModel? get residentialAddress;
  @override
  dynamic get phoneNumber;
  @override
  dynamic get email;
  @override
  dynamic get isBlocked;
  @override
  dynamic get subscriptionPlan;
  @override
  @JsonKey(ignore: true)
  _$$AllUserProfileModelImplCopyWith<_$AllUserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllUserProfileListModel _$AllUserProfileListModelFromJson(
    Map<String, dynamic> json) {
  return _AllUserProfileListModel.fromJson(json);
}

/// @nodoc
mixin _$AllUserProfileListModel {
  List<AllUserProfileModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllUserProfileListModelCopyWith<AllUserProfileListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllUserProfileListModelCopyWith<$Res> {
  factory $AllUserProfileListModelCopyWith(AllUserProfileListModel value,
          $Res Function(AllUserProfileListModel) then) =
      _$AllUserProfileListModelCopyWithImpl<$Res, AllUserProfileListModel>;
  @useResult
  $Res call({List<AllUserProfileModel>? data});
}

/// @nodoc
class _$AllUserProfileListModelCopyWithImpl<$Res,
        $Val extends AllUserProfileListModel>
    implements $AllUserProfileListModelCopyWith<$Res> {
  _$AllUserProfileListModelCopyWithImpl(this._value, this._then);

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
              as List<AllUserProfileModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllUserProfileListModelImplCopyWith<$Res>
    implements $AllUserProfileListModelCopyWith<$Res> {
  factory _$$AllUserProfileListModelImplCopyWith(
          _$AllUserProfileListModelImpl value,
          $Res Function(_$AllUserProfileListModelImpl) then) =
      __$$AllUserProfileListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllUserProfileModel>? data});
}

/// @nodoc
class __$$AllUserProfileListModelImplCopyWithImpl<$Res>
    extends _$AllUserProfileListModelCopyWithImpl<$Res,
        _$AllUserProfileListModelImpl>
    implements _$$AllUserProfileListModelImplCopyWith<$Res> {
  __$$AllUserProfileListModelImplCopyWithImpl(
      _$AllUserProfileListModelImpl _value,
      $Res Function(_$AllUserProfileListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AllUserProfileListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AllUserProfileModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AllUserProfileListModelImpl implements _AllUserProfileListModel {
  const _$AllUserProfileListModelImpl({final List<AllUserProfileModel>? data})
      : _data = data;

  factory _$AllUserProfileListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllUserProfileListModelImplFromJson(json);

  final List<AllUserProfileModel>? _data;
  @override
  List<AllUserProfileModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllUserProfileListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllUserProfileListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllUserProfileListModelImplCopyWith<_$AllUserProfileListModelImpl>
      get copyWith => __$$AllUserProfileListModelImplCopyWithImpl<
          _$AllUserProfileListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllUserProfileListModelImplToJson(
      this,
    );
  }
}

abstract class _AllUserProfileListModel implements AllUserProfileListModel {
  const factory _AllUserProfileListModel(
      {final List<AllUserProfileModel>? data}) = _$AllUserProfileListModelImpl;

  factory _AllUserProfileListModel.fromJson(Map<String, dynamic> json) =
      _$AllUserProfileListModelImpl.fromJson;

  @override
  List<AllUserProfileModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AllUserProfileListModelImplCopyWith<_$AllUserProfileListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
