// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryData _$CountryDataFromJson(Map<String, dynamic> json) {
  return _CountryData.fromJson(json);
}

/// @nodoc
mixin _$CountryData {
  String? get countryName => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get countryCurrency => throw _privateConstructorUsedError;
  List<PaymentOption> get paymentOptions => throw _privateConstructorUsedError;

  /// Serializes this CountryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryDataCopyWith<CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDataCopyWith<$Res> {
  factory $CountryDataCopyWith(
          CountryData value, $Res Function(CountryData) then) =
      _$CountryDataCopyWithImpl<$Res, CountryData>;
  @useResult
  $Res call(
      {String? countryName,
      String countryCode,
      String countryCurrency,
      List<PaymentOption> paymentOptions});
}

/// @nodoc
class _$CountryDataCopyWithImpl<$Res, $Val extends CountryData>
    implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? countryCode = null,
    Object? countryCurrency = null,
    Object? paymentOptions = null,
  }) {
    return _then(_value.copyWith(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCurrency: null == countryCurrency
          ? _value.countryCurrency
          : countryCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentOptions: null == paymentOptions
          ? _value.paymentOptions
          : paymentOptions // ignore: cast_nullable_to_non_nullable
              as List<PaymentOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryDataImplCopyWith<$Res>
    implements $CountryDataCopyWith<$Res> {
  factory _$$CountryDataImplCopyWith(
          _$CountryDataImpl value, $Res Function(_$CountryDataImpl) then) =
      __$$CountryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? countryName,
      String countryCode,
      String countryCurrency,
      List<PaymentOption> paymentOptions});
}

/// @nodoc
class __$$CountryDataImplCopyWithImpl<$Res>
    extends _$CountryDataCopyWithImpl<$Res, _$CountryDataImpl>
    implements _$$CountryDataImplCopyWith<$Res> {
  __$$CountryDataImplCopyWithImpl(
      _$CountryDataImpl _value, $Res Function(_$CountryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = freezed,
    Object? countryCode = null,
    Object? countryCurrency = null,
    Object? paymentOptions = null,
  }) {
    return _then(_$CountryDataImpl(
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCurrency: null == countryCurrency
          ? _value.countryCurrency
          : countryCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentOptions: null == paymentOptions
          ? _value._paymentOptions
          : paymentOptions // ignore: cast_nullable_to_non_nullable
              as List<PaymentOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryDataImpl implements _CountryData {
  const _$CountryDataImpl(
      {this.countryName,
      required this.countryCode,
      required this.countryCurrency,
      required final List<PaymentOption> paymentOptions})
      : _paymentOptions = paymentOptions;

  factory _$CountryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryDataImplFromJson(json);

  @override
  final String? countryName;
  @override
  final String countryCode;
  @override
  final String countryCurrency;
  final List<PaymentOption> _paymentOptions;
  @override
  List<PaymentOption> get paymentOptions {
    if (_paymentOptions is EqualUnmodifiableListView) return _paymentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentOptions);
  }

  @override
  String toString() {
    return 'CountryData(countryName: $countryName, countryCode: $countryCode, countryCurrency: $countryCurrency, paymentOptions: $paymentOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryDataImpl &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryCurrency, countryCurrency) ||
                other.countryCurrency == countryCurrency) &&
            const DeepCollectionEquality()
                .equals(other._paymentOptions, _paymentOptions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countryName, countryCode,
      countryCurrency, const DeepCollectionEquality().hash(_paymentOptions));

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDataImplCopyWith<_$CountryDataImpl> get copyWith =>
      __$$CountryDataImplCopyWithImpl<_$CountryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryDataImplToJson(
      this,
    );
  }
}

abstract class _CountryData implements CountryData {
  const factory _CountryData(
      {final String? countryName,
      required final String countryCode,
      required final String countryCurrency,
      required final List<PaymentOption> paymentOptions}) = _$CountryDataImpl;

  factory _CountryData.fromJson(Map<String, dynamic> json) =
      _$CountryDataImpl.fromJson;

  @override
  String? get countryName;
  @override
  String get countryCode;
  @override
  String get countryCurrency;
  @override
  List<PaymentOption> get paymentOptions;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryDataImplCopyWith<_$CountryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentOption _$PaymentOptionFromJson(Map<String, dynamic> json) {
  return _PaymentOption.fromJson(json);
}

/// @nodoc
mixin _$PaymentOption {
  String get payment => throw _privateConstructorUsedError;
  List<String> get providers => throw _privateConstructorUsedError;
  List<String> get mandatory => throw _privateConstructorUsedError;

  /// Serializes this PaymentOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentOptionCopyWith<PaymentOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentOptionCopyWith<$Res> {
  factory $PaymentOptionCopyWith(
          PaymentOption value, $Res Function(PaymentOption) then) =
      _$PaymentOptionCopyWithImpl<$Res, PaymentOption>;
  @useResult
  $Res call({String payment, List<String> providers, List<String> mandatory});
}

/// @nodoc
class _$PaymentOptionCopyWithImpl<$Res, $Val extends PaymentOption>
    implements $PaymentOptionCopyWith<$Res> {
  _$PaymentOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? providers = null,
    Object? mandatory = null,
  }) {
    return _then(_value.copyWith(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String,
      providers: null == providers
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentOptionImplCopyWith<$Res>
    implements $PaymentOptionCopyWith<$Res> {
  factory _$$PaymentOptionImplCopyWith(
          _$PaymentOptionImpl value, $Res Function(_$PaymentOptionImpl) then) =
      __$$PaymentOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String payment, List<String> providers, List<String> mandatory});
}

/// @nodoc
class __$$PaymentOptionImplCopyWithImpl<$Res>
    extends _$PaymentOptionCopyWithImpl<$Res, _$PaymentOptionImpl>
    implements _$$PaymentOptionImplCopyWith<$Res> {
  __$$PaymentOptionImplCopyWithImpl(
      _$PaymentOptionImpl _value, $Res Function(_$PaymentOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? providers = null,
    Object? mandatory = null,
  }) {
    return _then(_$PaymentOptionImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String,
      providers: null == providers
          ? _value._providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mandatory: null == mandatory
          ? _value._mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentOptionImpl implements _PaymentOption {
  const _$PaymentOptionImpl(
      {required this.payment,
      required final List<String> providers,
      required final List<String> mandatory})
      : _providers = providers,
        _mandatory = mandatory;

  factory _$PaymentOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentOptionImplFromJson(json);

  @override
  final String payment;
  final List<String> _providers;
  @override
  List<String> get providers {
    if (_providers is EqualUnmodifiableListView) return _providers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providers);
  }

  final List<String> _mandatory;
  @override
  List<String> get mandatory {
    if (_mandatory is EqualUnmodifiableListView) return _mandatory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mandatory);
  }

  @override
  String toString() {
    return 'PaymentOption(payment: $payment, providers: $providers, mandatory: $mandatory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentOptionImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            const DeepCollectionEquality()
                .equals(other._providers, _providers) &&
            const DeepCollectionEquality()
                .equals(other._mandatory, _mandatory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      payment,
      const DeepCollectionEquality().hash(_providers),
      const DeepCollectionEquality().hash(_mandatory));

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentOptionImplCopyWith<_$PaymentOptionImpl> get copyWith =>
      __$$PaymentOptionImplCopyWithImpl<_$PaymentOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentOptionImplToJson(
      this,
    );
  }
}

abstract class _PaymentOption implements PaymentOption {
  const factory _PaymentOption(
      {required final String payment,
      required final List<String> providers,
      required final List<String> mandatory}) = _$PaymentOptionImpl;

  factory _PaymentOption.fromJson(Map<String, dynamic> json) =
      _$PaymentOptionImpl.fromJson;

  @override
  String get payment;
  @override
  List<String> get providers;
  @override
  List<String> get mandatory;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentOptionImplCopyWith<_$PaymentOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
