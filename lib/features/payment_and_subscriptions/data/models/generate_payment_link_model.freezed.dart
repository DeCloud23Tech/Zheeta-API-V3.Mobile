// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_payment_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratePaymentLinkData {
  String get paymentProvider;
  PaymentGenerationData get paymentGenerationData;
  VerificationData? get verificationData;
  int get statusCode;
  String get message;
  bool get success;
  dynamic get data;

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeneratePaymentLinkDataCopyWith<GeneratePaymentLinkData> get copyWith =>
      _$GeneratePaymentLinkDataCopyWithImpl<GeneratePaymentLinkData>(
          this as GeneratePaymentLinkData, _$identity);

  /// Serializes this GeneratePaymentLinkData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeneratePaymentLinkData &&
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

  @override
  String toString() {
    return 'GeneratePaymentLinkData(paymentProvider: $paymentProvider, paymentGenerationData: $paymentGenerationData, verificationData: $verificationData, statusCode: $statusCode, message: $message, success: $success, data: $data)';
  }
}

/// @nodoc
abstract mixin class $GeneratePaymentLinkDataCopyWith<$Res> {
  factory $GeneratePaymentLinkDataCopyWith(GeneratePaymentLinkData value,
          $Res Function(GeneratePaymentLinkData) _then) =
      _$GeneratePaymentLinkDataCopyWithImpl;
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
class _$GeneratePaymentLinkDataCopyWithImpl<$Res>
    implements $GeneratePaymentLinkDataCopyWith<$Res> {
  _$GeneratePaymentLinkDataCopyWithImpl(this._self, this._then);

  final GeneratePaymentLinkData _self;
  final $Res Function(GeneratePaymentLinkData) _then;

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
    return _then(_self.copyWith(
      paymentProvider: null == paymentProvider
          ? _self.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentGenerationData: null == paymentGenerationData
          ? _self.paymentGenerationData
          : paymentGenerationData // ignore: cast_nullable_to_non_nullable
              as PaymentGenerationData,
      verificationData: freezed == verificationData
          ? _self.verificationData
          : verificationData // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentGenerationDataCopyWith<$Res> get paymentGenerationData {
    return $PaymentGenerationDataCopyWith<$Res>(_self.paymentGenerationData,
        (value) {
      return _then(_self.copyWith(paymentGenerationData: value));
    });
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res>? get verificationData {
    if (_self.verificationData == null) {
      return null;
    }

    return $VerificationDataCopyWith<$Res>(_self.verificationData!, (value) {
      return _then(_self.copyWith(verificationData: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _GeneratePaymentLinkData implements GeneratePaymentLinkData {
  const _GeneratePaymentLinkData(
      {required this.paymentProvider,
      required this.paymentGenerationData,
      this.verificationData,
      required this.statusCode,
      required this.message,
      required this.success,
      this.data});
  factory _GeneratePaymentLinkData.fromJson(Map<String, dynamic> json) =>
      _$GeneratePaymentLinkDataFromJson(json);

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

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeneratePaymentLinkDataCopyWith<_GeneratePaymentLinkData> get copyWith =>
      __$GeneratePaymentLinkDataCopyWithImpl<_GeneratePaymentLinkData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeneratePaymentLinkDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeneratePaymentLinkData &&
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

  @override
  String toString() {
    return 'GeneratePaymentLinkData(paymentProvider: $paymentProvider, paymentGenerationData: $paymentGenerationData, verificationData: $verificationData, statusCode: $statusCode, message: $message, success: $success, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$GeneratePaymentLinkDataCopyWith<$Res>
    implements $GeneratePaymentLinkDataCopyWith<$Res> {
  factory _$GeneratePaymentLinkDataCopyWith(_GeneratePaymentLinkData value,
          $Res Function(_GeneratePaymentLinkData) _then) =
      __$GeneratePaymentLinkDataCopyWithImpl;
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
class __$GeneratePaymentLinkDataCopyWithImpl<$Res>
    implements _$GeneratePaymentLinkDataCopyWith<$Res> {
  __$GeneratePaymentLinkDataCopyWithImpl(this._self, this._then);

  final _GeneratePaymentLinkData _self;
  final $Res Function(_GeneratePaymentLinkData) _then;

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentProvider = null,
    Object? paymentGenerationData = null,
    Object? verificationData = freezed,
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? data = freezed,
  }) {
    return _then(_GeneratePaymentLinkData(
      paymentProvider: null == paymentProvider
          ? _self.paymentProvider
          : paymentProvider // ignore: cast_nullable_to_non_nullable
              as String,
      paymentGenerationData: null == paymentGenerationData
          ? _self.paymentGenerationData
          : paymentGenerationData // ignore: cast_nullable_to_non_nullable
              as PaymentGenerationData,
      verificationData: freezed == verificationData
          ? _self.verificationData
          : verificationData // ignore: cast_nullable_to_non_nullable
              as VerificationData?,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentGenerationDataCopyWith<$Res> get paymentGenerationData {
    return $PaymentGenerationDataCopyWith<$Res>(_self.paymentGenerationData,
        (value) {
      return _then(_self.copyWith(paymentGenerationData: value));
    });
  }

  /// Create a copy of GeneratePaymentLinkData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res>? get verificationData {
    if (_self.verificationData == null) {
      return null;
    }

    return $VerificationDataCopyWith<$Res>(_self.verificationData!, (value) {
      return _then(_self.copyWith(verificationData: value));
    });
  }
}

/// @nodoc
mixin _$PaymentGenerationData {
  String get id;
  String get paymentLink;
  String? get addressToPayTo;
  String get currencyToPay;
  double get amountToPay;
  double get amountOfZheetaCoins;

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentGenerationDataCopyWith<PaymentGenerationData> get copyWith =>
      _$PaymentGenerationDataCopyWithImpl<PaymentGenerationData>(
          this as PaymentGenerationData, _$identity);

  /// Serializes this PaymentGenerationData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentGenerationData &&
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

  @override
  String toString() {
    return 'PaymentGenerationData(id: $id, paymentLink: $paymentLink, addressToPayTo: $addressToPayTo, currencyToPay: $currencyToPay, amountToPay: $amountToPay, amountOfZheetaCoins: $amountOfZheetaCoins)';
  }
}

/// @nodoc
abstract mixin class $PaymentGenerationDataCopyWith<$Res> {
  factory $PaymentGenerationDataCopyWith(PaymentGenerationData value,
          $Res Function(PaymentGenerationData) _then) =
      _$PaymentGenerationDataCopyWithImpl;
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
class _$PaymentGenerationDataCopyWithImpl<$Res>
    implements $PaymentGenerationDataCopyWith<$Res> {
  _$PaymentGenerationDataCopyWithImpl(this._self, this._then);

  final PaymentGenerationData _self;
  final $Res Function(PaymentGenerationData) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentLink: null == paymentLink
          ? _self.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
      addressToPayTo: freezed == addressToPayTo
          ? _self.addressToPayTo
          : addressToPayTo // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyToPay: null == currencyToPay
          ? _self.currencyToPay
          : currencyToPay // ignore: cast_nullable_to_non_nullable
              as String,
      amountToPay: null == amountToPay
          ? _self.amountToPay
          : amountToPay // ignore: cast_nullable_to_non_nullable
              as double,
      amountOfZheetaCoins: null == amountOfZheetaCoins
          ? _self.amountOfZheetaCoins
          : amountOfZheetaCoins // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentGenerationData implements PaymentGenerationData {
  const _PaymentGenerationData(
      {required this.id,
      required this.paymentLink,
      this.addressToPayTo,
      required this.currencyToPay,
      required this.amountToPay,
      required this.amountOfZheetaCoins});
  factory _PaymentGenerationData.fromJson(Map<String, dynamic> json) =>
      _$PaymentGenerationDataFromJson(json);

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

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentGenerationDataCopyWith<_PaymentGenerationData> get copyWith =>
      __$PaymentGenerationDataCopyWithImpl<_PaymentGenerationData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentGenerationDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentGenerationData &&
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

  @override
  String toString() {
    return 'PaymentGenerationData(id: $id, paymentLink: $paymentLink, addressToPayTo: $addressToPayTo, currencyToPay: $currencyToPay, amountToPay: $amountToPay, amountOfZheetaCoins: $amountOfZheetaCoins)';
  }
}

/// @nodoc
abstract mixin class _$PaymentGenerationDataCopyWith<$Res>
    implements $PaymentGenerationDataCopyWith<$Res> {
  factory _$PaymentGenerationDataCopyWith(_PaymentGenerationData value,
          $Res Function(_PaymentGenerationData) _then) =
      __$PaymentGenerationDataCopyWithImpl;
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
class __$PaymentGenerationDataCopyWithImpl<$Res>
    implements _$PaymentGenerationDataCopyWith<$Res> {
  __$PaymentGenerationDataCopyWithImpl(this._self, this._then);

  final _PaymentGenerationData _self;
  final $Res Function(_PaymentGenerationData) _then;

  /// Create a copy of PaymentGenerationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? paymentLink = null,
    Object? addressToPayTo = freezed,
    Object? currencyToPay = null,
    Object? amountToPay = null,
    Object? amountOfZheetaCoins = null,
  }) {
    return _then(_PaymentGenerationData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentLink: null == paymentLink
          ? _self.paymentLink
          : paymentLink // ignore: cast_nullable_to_non_nullable
              as String,
      addressToPayTo: freezed == addressToPayTo
          ? _self.addressToPayTo
          : addressToPayTo // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyToPay: null == currencyToPay
          ? _self.currencyToPay
          : currencyToPay // ignore: cast_nullable_to_non_nullable
              as String,
      amountToPay: null == amountToPay
          ? _self.amountToPay
          : amountToPay // ignore: cast_nullable_to_non_nullable
              as double,
      amountOfZheetaCoins: null == amountOfZheetaCoins
          ? _self.amountOfZheetaCoins
          : amountOfZheetaCoins // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$VerificationData {
  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is VerificationData);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerificationData()';
  }
}

/// @nodoc
class $VerificationDataCopyWith<$Res> {
  $VerificationDataCopyWith(
      VerificationData _, $Res Function(VerificationData) __);
}

/// @nodoc
@JsonSerializable()
class _VerificationData implements VerificationData {
  const _VerificationData();
  factory _VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$VerificationDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _VerificationData);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'VerificationData()';
  }
}

// dart format on
