// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_verification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEventVerification {
  String get id;
  String get userId;
  String get country;
  int get status;
  String get statusDescription;
  List<String> get proofOfAddressUrls;
  List<String> get proofOfIdentityUrls;
  String get proofOfFacialVideoUrl;
  String get nationIdentityNumber;
  List<String> get otherDocUrls;

  /// Create a copy of BuddyEventVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventVerificationCopyWith<BuddyEventVerification> get copyWith =>
      _$BuddyEventVerificationCopyWithImpl<BuddyEventVerification>(
          this as BuddyEventVerification, _$identity);

  /// Serializes this BuddyEventVerification to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventVerification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDescription, statusDescription) ||
                other.statusDescription == statusDescription) &&
            const DeepCollectionEquality()
                .equals(other.proofOfAddressUrls, proofOfAddressUrls) &&
            const DeepCollectionEquality()
                .equals(other.proofOfIdentityUrls, proofOfIdentityUrls) &&
            (identical(other.proofOfFacialVideoUrl, proofOfFacialVideoUrl) ||
                other.proofOfFacialVideoUrl == proofOfFacialVideoUrl) &&
            (identical(other.nationIdentityNumber, nationIdentityNumber) ||
                other.nationIdentityNumber == nationIdentityNumber) &&
            const DeepCollectionEquality()
                .equals(other.otherDocUrls, otherDocUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      country,
      status,
      statusDescription,
      const DeepCollectionEquality().hash(proofOfAddressUrls),
      const DeepCollectionEquality().hash(proofOfIdentityUrls),
      proofOfFacialVideoUrl,
      nationIdentityNumber,
      const DeepCollectionEquality().hash(otherDocUrls));

  @override
  String toString() {
    return 'BuddyEventVerification(id: $id, userId: $userId, country: $country, status: $status, statusDescription: $statusDescription, proofOfAddressUrls: $proofOfAddressUrls, proofOfIdentityUrls: $proofOfIdentityUrls, proofOfFacialVideoUrl: $proofOfFacialVideoUrl, nationIdentityNumber: $nationIdentityNumber, otherDocUrls: $otherDocUrls)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventVerificationCopyWith<$Res> {
  factory $BuddyEventVerificationCopyWith(BuddyEventVerification value,
          $Res Function(BuddyEventVerification) _then) =
      _$BuddyEventVerificationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String country,
      int status,
      String statusDescription,
      List<String> proofOfAddressUrls,
      List<String> proofOfIdentityUrls,
      String proofOfFacialVideoUrl,
      String nationIdentityNumber,
      List<String> otherDocUrls});
}

/// @nodoc
class _$BuddyEventVerificationCopyWithImpl<$Res>
    implements $BuddyEventVerificationCopyWith<$Res> {
  _$BuddyEventVerificationCopyWithImpl(this._self, this._then);

  final BuddyEventVerification _self;
  final $Res Function(BuddyEventVerification) _then;

  /// Create a copy of BuddyEventVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? country = null,
    Object? status = null,
    Object? statusDescription = null,
    Object? proofOfAddressUrls = null,
    Object? proofOfIdentityUrls = null,
    Object? proofOfFacialVideoUrl = null,
    Object? nationIdentityNumber = null,
    Object? otherDocUrls = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusDescription: null == statusDescription
          ? _self.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String,
      proofOfAddressUrls: null == proofOfAddressUrls
          ? _self.proofOfAddressUrls
          : proofOfAddressUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proofOfIdentityUrls: null == proofOfIdentityUrls
          ? _self.proofOfIdentityUrls
          : proofOfIdentityUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proofOfFacialVideoUrl: null == proofOfFacialVideoUrl
          ? _self.proofOfFacialVideoUrl
          : proofOfFacialVideoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nationIdentityNumber: null == nationIdentityNumber
          ? _self.nationIdentityNumber
          : nationIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otherDocUrls: null == otherDocUrls
          ? _self.otherDocUrls
          : otherDocUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEventVerification implements BuddyEventVerification {
  const _BuddyEventVerification(
      {required this.id,
      required this.userId,
      required this.country,
      required this.status,
      required this.statusDescription,
      required final List<String> proofOfAddressUrls,
      required final List<String> proofOfIdentityUrls,
      required this.proofOfFacialVideoUrl,
      required this.nationIdentityNumber,
      required final List<String> otherDocUrls})
      : _proofOfAddressUrls = proofOfAddressUrls,
        _proofOfIdentityUrls = proofOfIdentityUrls,
        _otherDocUrls = otherDocUrls;
  factory _BuddyEventVerification.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventVerificationFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String country;
  @override
  final int status;
  @override
  final String statusDescription;
  final List<String> _proofOfAddressUrls;
  @override
  List<String> get proofOfAddressUrls {
    if (_proofOfAddressUrls is EqualUnmodifiableListView)
      return _proofOfAddressUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proofOfAddressUrls);
  }

  final List<String> _proofOfIdentityUrls;
  @override
  List<String> get proofOfIdentityUrls {
    if (_proofOfIdentityUrls is EqualUnmodifiableListView)
      return _proofOfIdentityUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proofOfIdentityUrls);
  }

  @override
  final String proofOfFacialVideoUrl;
  @override
  final String nationIdentityNumber;
  final List<String> _otherDocUrls;
  @override
  List<String> get otherDocUrls {
    if (_otherDocUrls is EqualUnmodifiableListView) return _otherDocUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherDocUrls);
  }

  /// Create a copy of BuddyEventVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventVerificationCopyWith<_BuddyEventVerification> get copyWith =>
      __$BuddyEventVerificationCopyWithImpl<_BuddyEventVerification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventVerificationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventVerification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDescription, statusDescription) ||
                other.statusDescription == statusDescription) &&
            const DeepCollectionEquality()
                .equals(other._proofOfAddressUrls, _proofOfAddressUrls) &&
            const DeepCollectionEquality()
                .equals(other._proofOfIdentityUrls, _proofOfIdentityUrls) &&
            (identical(other.proofOfFacialVideoUrl, proofOfFacialVideoUrl) ||
                other.proofOfFacialVideoUrl == proofOfFacialVideoUrl) &&
            (identical(other.nationIdentityNumber, nationIdentityNumber) ||
                other.nationIdentityNumber == nationIdentityNumber) &&
            const DeepCollectionEquality()
                .equals(other._otherDocUrls, _otherDocUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      country,
      status,
      statusDescription,
      const DeepCollectionEquality().hash(_proofOfAddressUrls),
      const DeepCollectionEquality().hash(_proofOfIdentityUrls),
      proofOfFacialVideoUrl,
      nationIdentityNumber,
      const DeepCollectionEquality().hash(_otherDocUrls));

  @override
  String toString() {
    return 'BuddyEventVerification(id: $id, userId: $userId, country: $country, status: $status, statusDescription: $statusDescription, proofOfAddressUrls: $proofOfAddressUrls, proofOfIdentityUrls: $proofOfIdentityUrls, proofOfFacialVideoUrl: $proofOfFacialVideoUrl, nationIdentityNumber: $nationIdentityNumber, otherDocUrls: $otherDocUrls)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventVerificationCopyWith<$Res>
    implements $BuddyEventVerificationCopyWith<$Res> {
  factory _$BuddyEventVerificationCopyWith(_BuddyEventVerification value,
          $Res Function(_BuddyEventVerification) _then) =
      __$BuddyEventVerificationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String country,
      int status,
      String statusDescription,
      List<String> proofOfAddressUrls,
      List<String> proofOfIdentityUrls,
      String proofOfFacialVideoUrl,
      String nationIdentityNumber,
      List<String> otherDocUrls});
}

/// @nodoc
class __$BuddyEventVerificationCopyWithImpl<$Res>
    implements _$BuddyEventVerificationCopyWith<$Res> {
  __$BuddyEventVerificationCopyWithImpl(this._self, this._then);

  final _BuddyEventVerification _self;
  final $Res Function(_BuddyEventVerification) _then;

  /// Create a copy of BuddyEventVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? country = null,
    Object? status = null,
    Object? statusDescription = null,
    Object? proofOfAddressUrls = null,
    Object? proofOfIdentityUrls = null,
    Object? proofOfFacialVideoUrl = null,
    Object? nationIdentityNumber = null,
    Object? otherDocUrls = null,
  }) {
    return _then(_BuddyEventVerification(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      statusDescription: null == statusDescription
          ? _self.statusDescription
          : statusDescription // ignore: cast_nullable_to_non_nullable
              as String,
      proofOfAddressUrls: null == proofOfAddressUrls
          ? _self._proofOfAddressUrls
          : proofOfAddressUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proofOfIdentityUrls: null == proofOfIdentityUrls
          ? _self._proofOfIdentityUrls
          : proofOfIdentityUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      proofOfFacialVideoUrl: null == proofOfFacialVideoUrl
          ? _self.proofOfFacialVideoUrl
          : proofOfFacialVideoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      nationIdentityNumber: null == nationIdentityNumber
          ? _self.nationIdentityNumber
          : nationIdentityNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otherDocUrls: null == otherDocUrls
          ? _self._otherDocUrls
          : otherDocUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
