// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_from_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressFromLocationModel {
  dynamic get streetNumber;
  dynamic get address;
  dynamic get country;
  dynamic get state;
  dynamic get city;
  dynamic get postalCode;

  /// Create a copy of AddressFromLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressFromLocationModelCopyWith<AddressFromLocationModel> get copyWith =>
      _$AddressFromLocationModelCopyWithImpl<AddressFromLocationModel>(
          this as AddressFromLocationModel, _$identity);

  /// Serializes this AddressFromLocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressFromLocationModel &&
            const DeepCollectionEquality()
                .equals(other.streetNumber, streetNumber) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streetNumber),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(postalCode));

  @override
  String toString() {
    return 'AddressFromLocationModel(streetNumber: $streetNumber, address: $address, country: $country, state: $state, city: $city, postalCode: $postalCode)';
  }
}

/// @nodoc
abstract mixin class $AddressFromLocationModelCopyWith<$Res> {
  factory $AddressFromLocationModelCopyWith(AddressFromLocationModel value,
          $Res Function(AddressFromLocationModel) _then) =
      _$AddressFromLocationModelCopyWithImpl;
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
class _$AddressFromLocationModelCopyWithImpl<$Res>
    implements $AddressFromLocationModelCopyWith<$Res> {
  _$AddressFromLocationModelCopyWithImpl(this._self, this._then);

  final AddressFromLocationModel _self;
  final $Res Function(AddressFromLocationModel) _then;

  /// Create a copy of AddressFromLocationModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      streetNumber: freezed == streetNumber
          ? _self.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddressFromLocationModel implements AddressFromLocationModel {
  _AddressFromLocationModel(
      {this.streetNumber,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postalCode});
  factory _AddressFromLocationModel.fromJson(Map<String, dynamic> json) =>
      _$AddressFromLocationModelFromJson(json);

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

  /// Create a copy of AddressFromLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressFromLocationModelCopyWith<_AddressFromLocationModel> get copyWith =>
      __$AddressFromLocationModelCopyWithImpl<_AddressFromLocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressFromLocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressFromLocationModel &&
            const DeepCollectionEquality()
                .equals(other.streetNumber, streetNumber) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other.postalCode, postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streetNumber),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(postalCode));

  @override
  String toString() {
    return 'AddressFromLocationModel(streetNumber: $streetNumber, address: $address, country: $country, state: $state, city: $city, postalCode: $postalCode)';
  }
}

/// @nodoc
abstract mixin class _$AddressFromLocationModelCopyWith<$Res>
    implements $AddressFromLocationModelCopyWith<$Res> {
  factory _$AddressFromLocationModelCopyWith(_AddressFromLocationModel value,
          $Res Function(_AddressFromLocationModel) _then) =
      __$AddressFromLocationModelCopyWithImpl;
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
class __$AddressFromLocationModelCopyWithImpl<$Res>
    implements _$AddressFromLocationModelCopyWith<$Res> {
  __$AddressFromLocationModelCopyWithImpl(this._self, this._then);

  final _AddressFromLocationModel _self;
  final $Res Function(_AddressFromLocationModel) _then;

  /// Create a copy of AddressFromLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? streetNumber = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_AddressFromLocationModel(
      streetNumber: freezed == streetNumber
          ? _self.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
