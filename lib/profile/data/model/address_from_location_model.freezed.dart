// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_from_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressFromLocationModel _$AddressFromLocationModelFromJson(
    Map<String, dynamic> json) {
  return _AddressFromLocationModel.fromJson(json);
}

/// @nodoc
mixin _$AddressFromLocationModel {
  dynamic get streetNumber => throw _privateConstructorUsedError;
  dynamic get address => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressFromLocationModelCopyWith<AddressFromLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFromLocationModelCopyWith<$Res> {
  factory $AddressFromLocationModelCopyWith(AddressFromLocationModel value,
          $Res Function(AddressFromLocationModel) then) =
      _$AddressFromLocationModelCopyWithImpl<$Res, AddressFromLocationModel>;
  @useResult
  $Res call(
      {dynamic streetNumber,
      dynamic address,
      dynamic country,
      dynamic state,
      dynamic city,
      dynamic postalCode});
}

/// @nodoc
class _$AddressFromLocationModelCopyWithImpl<$Res,
        $Val extends AddressFromLocationModel>
    implements $AddressFromLocationModelCopyWith<$Res> {
  _$AddressFromLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetNumber = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      streetNumber: freezed == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressFromLocationModelImplCopyWith<$Res>
    implements $AddressFromLocationModelCopyWith<$Res> {
  factory _$$AddressFromLocationModelImplCopyWith(
          _$AddressFromLocationModelImpl value,
          $Res Function(_$AddressFromLocationModelImpl) then) =
      __$$AddressFromLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic streetNumber,
      dynamic address,
      dynamic country,
      dynamic state,
      dynamic city,
      dynamic postalCode});
}

/// @nodoc
class __$$AddressFromLocationModelImplCopyWithImpl<$Res>
    extends _$AddressFromLocationModelCopyWithImpl<$Res,
        _$AddressFromLocationModelImpl>
    implements _$$AddressFromLocationModelImplCopyWith<$Res> {
  __$$AddressFromLocationModelImplCopyWithImpl(
      _$AddressFromLocationModelImpl _value,
      $Res Function(_$AddressFromLocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetNumber = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$AddressFromLocationModelImpl(
      streetNumber: freezed == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$AddressFromLocationModelImpl implements _AddressFromLocationModel {
  const _$AddressFromLocationModelImpl(
      {this.streetNumber,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postalCode});

  factory _$AddressFromLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressFromLocationModelImplFromJson(json);

  @override
  final dynamic streetNumber;
  @override
  final dynamic address;
  @override
  final dynamic country;
  @override
  final dynamic state;
  @override
  final dynamic city;
  @override
  final dynamic postalCode;

  @override
  String toString() {
    return 'AddressFromLocationModel(streetNumber: $streetNumber, address: $address, country: $country, state: $state, city: $city, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressFromLocationModelImpl &&
            const DeepCollectionEquality()
                .equals(other.streetNumber, streetNumber) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streetNumber),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(postalCode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressFromLocationModelImplCopyWith<_$AddressFromLocationModelImpl>
      get copyWith => __$$AddressFromLocationModelImplCopyWithImpl<
          _$AddressFromLocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressFromLocationModelImplToJson(
      this,
    );
  }
}

abstract class _AddressFromLocationModel implements AddressFromLocationModel {
  const factory _AddressFromLocationModel(
      {final dynamic streetNumber,
      final dynamic address,
      final dynamic country,
      final dynamic state,
      final dynamic city,
      final dynamic postalCode}) = _$AddressFromLocationModelImpl;

  factory _AddressFromLocationModel.fromJson(Map<String, dynamic> json) =
      _$AddressFromLocationModelImpl.fromJson;

  @override
  dynamic get streetNumber;
  @override
  dynamic get address;
  @override
  dynamic get country;
  @override
  dynamic get state;
  @override
  dynamic get city;
  @override
  dynamic get postalCode;
  @override
  @JsonKey(ignore: true)
  _$$AddressFromLocationModelImplCopyWith<_$AddressFromLocationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
