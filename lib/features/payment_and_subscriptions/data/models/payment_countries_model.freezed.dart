// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryData {
  String get code;
  String get code2Iso;
  String get name;
  String? get phoneCode;
  String get currency;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryDataCopyWith<CountryData> get copyWith =>
      _$CountryDataCopyWithImpl<CountryData>(this as CountryData, _$identity);

  /// Serializes this CountryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.code2Iso, code2Iso) ||
                other.code2Iso == code2Iso) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, code2Iso, name, phoneCode, currency);

  @override
  String toString() {
    return 'CountryData(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $CountryDataCopyWith<$Res> {
  factory $CountryDataCopyWith(
          CountryData value, $Res Function(CountryData) _then) =
      _$CountryDataCopyWithImpl;
  @useResult
  $Res call(
      {String code,
      String code2Iso,
      String name,
      String? phoneCode,
      String currency});
}

/// @nodoc
class _$CountryDataCopyWithImpl<$Res> implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._self, this._then);

  final CountryData _self;
  final $Res Function(CountryData) _then;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? code2Iso = null,
    Object? name = null,
    Object? phoneCode = freezed,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      code2Iso: null == code2Iso
          ? _self.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCode: freezed == phoneCode
          ? _self.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CountryData implements CountryData {
  const _CountryData(
      {required this.code,
      required this.code2Iso,
      required this.name,
      this.phoneCode,
      required this.currency});
  factory _CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);

  @override
  final String code;
  @override
  final String code2Iso;
  @override
  final String name;
  @override
  final String? phoneCode;
  @override
  final String currency;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryDataCopyWith<_CountryData> get copyWith =>
      __$CountryDataCopyWithImpl<_CountryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryData &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.code2Iso, code2Iso) ||
                other.code2Iso == code2Iso) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, code2Iso, name, phoneCode, currency);

  @override
  String toString() {
    return 'CountryData(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$CountryDataCopyWith<$Res>
    implements $CountryDataCopyWith<$Res> {
  factory _$CountryDataCopyWith(
          _CountryData value, $Res Function(_CountryData) _then) =
      __$CountryDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String code,
      String code2Iso,
      String name,
      String? phoneCode,
      String currency});
}

/// @nodoc
class __$CountryDataCopyWithImpl<$Res> implements _$CountryDataCopyWith<$Res> {
  __$CountryDataCopyWithImpl(this._self, this._then);

  final _CountryData _self;
  final $Res Function(_CountryData) _then;

  /// Create a copy of CountryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? code2Iso = null,
    Object? name = null,
    Object? phoneCode = freezed,
    Object? currency = null,
  }) {
    return _then(_CountryData(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      code2Iso: null == code2Iso
          ? _self.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneCode: freezed == phoneCode
          ? _self.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PaymentOption {
  String get payment;
  List<String> get providers;
  List<String> get mandatory;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentOptionCopyWith<PaymentOption> get copyWith =>
      _$PaymentOptionCopyWithImpl<PaymentOption>(
          this as PaymentOption, _$identity);

  /// Serializes this PaymentOption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentOption &&
            (identical(other.payment, payment) || other.payment == payment) &&
            const DeepCollectionEquality().equals(other.providers, providers) &&
            const DeepCollectionEquality().equals(other.mandatory, mandatory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      payment,
      const DeepCollectionEquality().hash(providers),
      const DeepCollectionEquality().hash(mandatory));

  @override
  String toString() {
    return 'PaymentOption(payment: $payment, providers: $providers, mandatory: $mandatory)';
  }
}

/// @nodoc
abstract mixin class $PaymentOptionCopyWith<$Res> {
  factory $PaymentOptionCopyWith(
          PaymentOption value, $Res Function(PaymentOption) _then) =
      _$PaymentOptionCopyWithImpl;
  @useResult
  $Res call({String payment, List<String> providers, List<String> mandatory});
}

/// @nodoc
class _$PaymentOptionCopyWithImpl<$Res>
    implements $PaymentOptionCopyWith<$Res> {
  _$PaymentOptionCopyWithImpl(this._self, this._then);

  final PaymentOption _self;
  final $Res Function(PaymentOption) _then;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? providers = null,
    Object? mandatory = null,
  }) {
    return _then(_self.copyWith(
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String,
      providers: null == providers
          ? _self.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mandatory: null == mandatory
          ? _self.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentOption implements PaymentOption {
  const _PaymentOption(
      {required this.payment,
      required final List<String> providers,
      required final List<String> mandatory})
      : _providers = providers,
        _mandatory = mandatory;
  factory _PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);

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

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentOptionCopyWith<_PaymentOption> get copyWith =>
      __$PaymentOptionCopyWithImpl<_PaymentOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentOptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentOption &&
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

  @override
  String toString() {
    return 'PaymentOption(payment: $payment, providers: $providers, mandatory: $mandatory)';
  }
}

/// @nodoc
abstract mixin class _$PaymentOptionCopyWith<$Res>
    implements $PaymentOptionCopyWith<$Res> {
  factory _$PaymentOptionCopyWith(
          _PaymentOption value, $Res Function(_PaymentOption) _then) =
      __$PaymentOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String payment, List<String> providers, List<String> mandatory});
}

/// @nodoc
class __$PaymentOptionCopyWithImpl<$Res>
    implements _$PaymentOptionCopyWith<$Res> {
  __$PaymentOptionCopyWithImpl(this._self, this._then);

  final _PaymentOption _self;
  final $Res Function(_PaymentOption) _then;

  /// Create a copy of PaymentOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? payment = null,
    Object? providers = null,
    Object? mandatory = null,
  }) {
    return _then(_PaymentOption(
      payment: null == payment
          ? _self.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as String,
      providers: null == providers
          ? _self._providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mandatory: null == mandatory
          ? _self._mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
