// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryDetailModel {
  String? get code;
  String? get code2Iso;
  String? get name;
  String? get phoneCode;
  String? get currency;
  List<String>? get cities;

  /// Create a copy of CountryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryDetailModelCopyWith<CountryDetailModel> get copyWith =>
      _$CountryDetailModelCopyWithImpl<CountryDetailModel>(
          this as CountryDetailModel, _$identity);

  /// Serializes this CountryDetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryDetailModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.code2Iso, code2Iso) ||
                other.code2Iso == code2Iso) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other.cities, cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, code2Iso, name, phoneCode,
      currency, const DeepCollectionEquality().hash(cities));

  @override
  String toString() {
    return 'CountryDetailModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency, cities: $cities)';
  }
}

/// @nodoc
abstract mixin class $CountryDetailModelCopyWith<$Res> {
  factory $CountryDetailModelCopyWith(
          CountryDetailModel value, $Res Function(CountryDetailModel) _then) =
      _$CountryDetailModelCopyWithImpl;
  @useResult
  $Res call(
      {String? code,
      String? code2Iso,
      String? name,
      String? phoneCode,
      String? currency,
      List<String>? cities});
}

/// @nodoc
class _$CountryDetailModelCopyWithImpl<$Res>
    implements $CountryDetailModelCopyWith<$Res> {
  _$CountryDetailModelCopyWithImpl(this._self, this._then);

  final CountryDetailModel _self;
  final $Res Function(CountryDetailModel) _then;

  /// Create a copy of CountryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? code2Iso = freezed,
    Object? name = freezed,
    Object? phoneCode = freezed,
    Object? currency = freezed,
    Object? cities = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      code2Iso: freezed == code2Iso
          ? _self.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _self.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      cities: freezed == cities
          ? _self.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CountryDetailModel implements CountryDetailModel {
  _CountryDetailModel(
      {this.code,
      this.code2Iso,
      this.name,
      this.phoneCode,
      this.currency,
      final List<String>? cities})
      : _cities = cities;
  factory _CountryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailModelFromJson(json);

  @override
  final String? code;
  @override
  final String? code2Iso;
  @override
  final String? name;
  @override
  final String? phoneCode;
  @override
  final String? currency;
  final List<String>? _cities;
  @override
  List<String>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CountryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryDetailModelCopyWith<_CountryDetailModel> get copyWith =>
      __$CountryDetailModelCopyWithImpl<_CountryDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryDetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryDetailModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.code2Iso, code2Iso) ||
                other.code2Iso == code2Iso) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, code2Iso, name, phoneCode,
      currency, const DeepCollectionEquality().hash(_cities));

  @override
  String toString() {
    return 'CountryDetailModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency, cities: $cities)';
  }
}

/// @nodoc
abstract mixin class _$CountryDetailModelCopyWith<$Res>
    implements $CountryDetailModelCopyWith<$Res> {
  factory _$CountryDetailModelCopyWith(
          _CountryDetailModel value, $Res Function(_CountryDetailModel) _then) =
      __$CountryDetailModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? code,
      String? code2Iso,
      String? name,
      String? phoneCode,
      String? currency,
      List<String>? cities});
}

/// @nodoc
class __$CountryDetailModelCopyWithImpl<$Res>
    implements _$CountryDetailModelCopyWith<$Res> {
  __$CountryDetailModelCopyWithImpl(this._self, this._then);

  final _CountryDetailModel _self;
  final $Res Function(_CountryDetailModel) _then;

  /// Create a copy of CountryDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? code2Iso = freezed,
    Object? name = freezed,
    Object? phoneCode = freezed,
    Object? currency = freezed,
    Object? cities = freezed,
  }) {
    return _then(_CountryDetailModel(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      code2Iso: freezed == code2Iso
          ? _self.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _self.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      cities: freezed == cities
          ? _self._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
