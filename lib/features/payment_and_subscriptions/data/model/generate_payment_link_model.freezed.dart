// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_payment_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneratePaymentLinkData _$GeneratePaymentLinkDataFromJson(
    Map<String, dynamic> json) {
  return _GeneratePaymentLinkData.fromJson(json);
}

/// @nodoc
mixin _$GeneratePaymentLinkData {
  String get paymentProvider => throw _privateConstructorUsedError;
  PaymentGenerationData get paymentGenerationData =>
      throw _privateConstructorUsedError;
  VerificationData? get verificationData => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this GeneratePaymentLinkData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratePaymentLinkDataCopyWith<GeneratePaymentLinkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratePaymentLinkDataCopyWith<$Res> {
  factory $GeneratePaymentLinkDataCopyWith(GeneratePaymentLinkData value,
          $Res Function(GeneratePaymentLinkData) then) =
      _$GeneratePaymentLinkDataCopyWithImpl<$Res, GeneratePaymentLinkData>;
  @useResult
  $Res call(
      {String paymentProvider,
      PaymentGenerationData paymentGenerationData,
      VerificationData? verificationData,
      int statusCode,
      String message,
      bool success,
      dynamic data});

  $PaymentGenerationDataCopyWith<$Res> get paymentGenerationData;
  $VerificationDataCopyWith<$Res>? get verificationData;
}

/// @nodoc
class _$GeneratePaymentLinkDataCopyWithImpl<$Res,
        $Val extends GeneratePaymentLinkData>
    implements $GeneratePaymentLinkDataCopyWith<$Res> {
  _$GeneratePaymentLinkDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProvider = null,
    Object? paymentGenerationData = null,
    Object? verificationData = freezed,
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      paymentProvider: null == paymentProvider
          ? _value.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentGenerationData: null == paymentGenerationData
          ? _value.paymentGenerationData
          : paymentGenerationData // ignore: cast_nullable_to_non_nullable
              as PaymentGenerationData,
      verificationData: freezed == verificationData
          ? _value.verificationData
          : verificationData // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentGenerationDataCopyWith<$Res> get paymentGenerationData {
    return $PaymentGenerationDataCopyWith<$Res>(_value.paymentGenerationData,
        (value) {
      return _then(_value.copyWith(paymentGenerationData: value) as $Val);
    });
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res>? get verificationData {
    if (_value.verificationData == null) {
      return null;
    }

    return $VerificationDataCopyWith<$Res>(_value.verificationData!, (value) {
      return _then(_value.copyWith(verificationData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeneratePaymentLinkDataImplCopyWith<$Res>
    implements $GeneratePaymentLinkDataCopyWith<$Res> {
  factory _$$GeneratePaymentLinkDataImplCopyWith(
          _$GeneratePaymentLinkDataImpl value,
          $Res Function(_$GeneratePaymentLinkDataImpl) then) =
      __$$GeneratePaymentLinkDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentProvider,
      PaymentGenerationData paymentGenerationData,
      VerificationData? verificationData,
      int statusCode,
      String message,
      bool success,
      dynamic data});

  @override
  $PaymentGenerationDataCopyWith<$Res> get paymentGenerationData;
  @override
  $VerificationDataCopyWith<$Res>? get verificationData;
}

/// @nodoc
class __$$GeneratePaymentLinkDataImplCopyWithImpl<$Res>
    extends _$GeneratePaymentLinkDataCopyWithImpl<$Res,
        _$GeneratePaymentLinkDataImpl>
    implements _$$GeneratePaymentLinkDataImplCopyWith<$Res> {
  __$$GeneratePaymentLinkDataImplCopyWithImpl(
      _$GeneratePaymentLinkDataImpl _value,
      $Res Function(_$GeneratePaymentLinkDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentProvider = null,
    Object? paymentGenerationData = null,
    Object? verificationData = freezed,
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_$GeneratePaymentLinkDataImpl(
      paymentProvider: null == paymentProvider
          ? _value.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentGenerationData: null == paymentGenerationData
          ? _value.paymentGenerationData
          : paymentGenerationData // ignore: cast_nullable_to_non_nullable
              as PaymentGenerationData,
      verificationData: freezed == verificationData
          ? _value.verificationData
          : verificationData // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneratePaymentLinkDataImpl implements _GeneratePaymentLinkData {
  const _$GeneratePaymentLinkDataImpl(
      {required this.paymentProvider,
      required this.paymentGenerationData,
      this.verificationData,
      required this.statusCode,
      required this.message,
      required this.success,
      this.data});

  factory _$GeneratePaymentLinkDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneratePaymentLinkDataImplFromJson(json);

  @override
  final String paymentProvider;
  @override
  final PaymentGenerationData paymentGenerationData;
  @override
  final VerificationData? verificationData;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'GeneratePaymentLinkData(paymentProvider: $paymentProvider, paymentGenerationData: $paymentGenerationData, verificationData: $verificationData, statusCode: $statusCode, message: $message, success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratePaymentLinkDataImpl &&
            (identical(other.paymentProvider, paymentProvider) ||
                other.paymentProvider == paymentProvider) &&
            (identical(other.paymentGenerationData, paymentGenerationData) ||
                other.paymentGenerationData == paymentGenerationData) &&
            (identical(other.verificationData, verificationData) ||
                other.verificationData == verificationData) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentProvider,
      paymentGenerationData,
      verificationData,
      statusCode,
      message,
      success,
      const DeepCollectionEquality().hash(data));

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratePaymentLinkDataImplCopyWith<_$GeneratePaymentLinkDataImpl>
      get copyWith => __$$GeneratePaymentLinkDataImplCopyWithImpl<
          _$GeneratePaymentLinkDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneratePaymentLinkDataImplToJson(
      this,
    );
  }
}

abstract class _GeneratePaymentLinkData implements GeneratePaymentLinkData {
  const factory _GeneratePaymentLinkData(
      {required final String paymentProvider,
      required final PaymentGenerationData paymentGenerationData,
      final VerificationData? verificationData,
      required final int statusCode,
      required final String message,
      required final bool success,
      final dynamic data}) = _$GeneratePaymentLinkDataImpl;

  factory _GeneratePaymentLinkData.fromJson(Map<String, dynamic> json) =
      _$GeneratePaymentLinkDataImpl.fromJson;

  @override
  String get paymentProvider;
  @override
  PaymentGenerationData get paymentGenerationData;
  @override
  VerificationData? get verificationData;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  dynamic get data;

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratePaymentLinkDataImplCopyWith<_$GeneratePaymentLinkDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentGenerationData _$PaymentGenerationDataFromJson(
    Map<String, dynamic> json) {
  return _PaymentGenerationData.fromJson(json);
}

/// @nodoc
mixin _$PaymentGenerationData {
  String get id => throw _privateConstructorUsedError;
  String get paymentLink => throw _privateConstructorUsedError;
  String? get addressToPayTo => throw _privateConstructorUsedError;
  String get currencyToPay => throw _privateConstructorUsedError;
  double get amountToPay => throw _privateConstructorUsedError;
  double get amountOfZheetaCoins => throw _privateConstructorUsedError;

  /// Serializes this PaymentGenerationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentGenerationDataCopyWith<PaymentGenerationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentGenerationDataCopyWith<$Res> {
  factory $PaymentGenerationDataCopyWith(PaymentGenerationData value,
          $Res Function(PaymentGenerationData) then) =
      _$PaymentGenerationDataCopyWithImpl<$Res, PaymentGenerationData>;
  @useResult
  $Res call(
      {String id,
      String paymentLink,
      String? addressToPayTo,
      String currencyToPay,
      double amountToPay,
      double amountOfZheetaCoins});
}

/// @nodoc
class _$PaymentGenerationDataCopyWithImpl<$Res,
        $Val extends PaymentGenerationData>
    implements $PaymentGenerationDataCopyWith<$Res> {
  _$PaymentGenerationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentLink = null,
    Object? addressToPayTo = freezed,
    Object? currencyToPay = null,
    Object? amountToPay = null,
    Object? amountOfZheetaCoins = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
      addressToPayTo: freezed == addressToPayTo
          ? _value.addressToPayTo
          : addressToPayTo // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyToPay: null == currencyToPay
          ? _value.currencyToPay
          : currencyToPay // ignore: cast_nullable_to_non_nullable
              as String,
      amountToPay: null == amountToPay
          ? _value.amountToPay
          : amountToPay // ignore: cast_nullable_to_non_nullable
              as double,
      amountOfZheetaCoins: null == amountOfZheetaCoins
          ? _value.amountOfZheetaCoins
          : amountOfZheetaCoins // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentGenerationDataImplCopyWith<$Res>
    implements $PaymentGenerationDataCopyWith<$Res> {
  factory _$$PaymentGenerationDataImplCopyWith(
          _$PaymentGenerationDataImpl value,
          $Res Function(_$PaymentGenerationDataImpl) then) =
      __$$PaymentGenerationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentLink,
      String? addressToPayTo,
      String currencyToPay,
      double amountToPay,
      double amountOfZheetaCoins});
}

/// @nodoc
class __$$PaymentGenerationDataImplCopyWithImpl<$Res>
    extends _$PaymentGenerationDataCopyWithImpl<$Res,
        _$PaymentGenerationDataImpl>
    implements _$$PaymentGenerationDataImplCopyWith<$Res> {
  __$$PaymentGenerationDataImplCopyWithImpl(_$PaymentGenerationDataImpl _value,
      $Res Function(_$PaymentGenerationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentLink = null,
    Object? addressToPayTo = freezed,
    Object? currencyToPay = null,
    Object? amountToPay = null,
    Object? amountOfZheetaCoins = null,
  }) {
    return _then(_$PaymentGenerationDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentLink: null == paymentLink
          ? _value.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
      addressToPayTo: freezed == addressToPayTo
          ? _value.addressToPayTo
          : addressToPayTo // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyToPay: null == currencyToPay
          ? _value.currencyToPay
          : currencyToPay // ignore: cast_nullable_to_non_nullable
              as String,
      amountToPay: null == amountToPay
          ? _value.amountToPay
          : amountToPay // ignore: cast_nullable_to_non_nullable
              as double,
      amountOfZheetaCoins: null == amountOfZheetaCoins
          ? _value.amountOfZheetaCoins
          : amountOfZheetaCoins // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentGenerationDataImpl implements _PaymentGenerationData {
  const _$PaymentGenerationDataImpl(
      {required this.id,
      required this.paymentLink,
      this.addressToPayTo,
      required this.currencyToPay,
      required this.amountToPay,
      required this.amountOfZheetaCoins});

  factory _$PaymentGenerationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentGenerationDataImplFromJson(json);

  @override
  final String id;
  @override
  final String paymentLink;
  @override
  final String? addressToPayTo;
  @override
  final String currencyToPay;
  @override
  final double amountToPay;
  @override
  final double amountOfZheetaCoins;

  @override
  String toString() {
    return 'PaymentGenerationData(id: $id, paymentLink: $paymentLink, addressToPayTo: $addressToPayTo, currencyToPay: $currencyToPay, amountToPay: $amountToPay, amountOfZheetaCoins: $amountOfZheetaCoins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentGenerationDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentLink, paymentLink) ||
                other.paymentLink == paymentLink) &&
            (identical(other.addressToPayTo, addressToPayTo) ||
                other.addressToPayTo == addressToPayTo) &&
            (identical(other.currencyToPay, currencyToPay) ||
                other.currencyToPay == currencyToPay) &&
            (identical(other.amountToPay, amountToPay) ||
                other.amountToPay == amountToPay) &&
            (identical(other.amountOfZheetaCoins, amountOfZheetaCoins) ||
                other.amountOfZheetaCoins == amountOfZheetaCoins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paymentLink, addressToPayTo,
      currencyToPay, amountToPay, amountOfZheetaCoins);

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentGenerationDataImplCopyWith<_$PaymentGenerationDataImpl>
      get copyWith => __$$PaymentGenerationDataImplCopyWithImpl<
          _$PaymentGenerationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentGenerationDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentGenerationData implements PaymentGenerationData {
  const factory _PaymentGenerationData(
      {required final String id,
      required final String paymentLink,
      final String? addressToPayTo,
      required final String currencyToPay,
      required final double amountToPay,
      required final double amountOfZheetaCoins}) = _$PaymentGenerationDataImpl;

  factory _PaymentGenerationData.fromJson(Map<String, dynamic> json) =
      _$PaymentGenerationDataImpl.fromJson;

  @override
  String get id;
  @override
  String get paymentLink;
  @override
  String? get addressToPayTo;
  @override
  String get currencyToPay;
  @override
  double get amountToPay;
  @override
  double get amountOfZheetaCoins;

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentGenerationDataImplCopyWith<_$PaymentGenerationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) {
  return _VerificationData.fromJson(json);
}

/// @nodoc
mixin _$VerificationData {
  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationDataCopyWith<$Res> {
  factory $VerificationDataCopyWith(
          VerificationData value, $Res Function(VerificationData) then) =
      _$VerificationDataCopyWithImpl<$Res, VerificationData>;
}

/// @nodoc
class _$VerificationDataCopyWithImpl<$Res, $Val extends VerificationData>
    implements $VerificationDataCopyWith<$Res> {
  _$VerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VerificationDataImplCopyWith<$Res> {
  factory _$$VerificationDataImplCopyWith(_$VerificationDataImpl value,
          $Res Function(_$VerificationDataImpl) then) =
      __$$VerificationDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerificationDataImplCopyWithImpl<$Res>
    extends _$VerificationDataCopyWithImpl<$Res, _$VerificationDataImpl>
    implements _$$VerificationDataImplCopyWith<$Res> {
  __$$VerificationDataImplCopyWithImpl(_$VerificationDataImpl _value,
      $Res Function(_$VerificationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$VerificationDataImpl implements _VerificationData {
  const _$VerificationDataImpl();

  factory _$VerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationDataImplFromJson(json);

  @override
  String toString() {
    return 'VerificationData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerificationDataImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationDataImplToJson(
      this,
    );
  }
}

abstract class _VerificationData implements VerificationData {
  const factory _VerificationData() = _$VerificationDataImpl;

  factory _VerificationData.fromJson(Map<String, dynamic> json) =
      _$VerificationDataImpl.fromJson;
}
