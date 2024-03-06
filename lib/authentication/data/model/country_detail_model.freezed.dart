// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryDetailModel _$CountryDetailModelFromJson(Map<String, dynamic> json) {
  return _CountryDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CountryDetailModel {
  String? get code => throw _privateConstructorUsedError;
  String? get code2Iso => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  List<String>? get cities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryDetailModelCopyWith<CountryDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDetailModelCopyWith<$Res> {
  factory $CountryDetailModelCopyWith(
          CountryDetailModel value, $Res Function(CountryDetailModel) then) =
      _$CountryDetailModelCopyWithImpl<$Res, CountryDetailModel>;
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
class _$CountryDetailModelCopyWithImpl<$Res, $Val extends CountryDetailModel>
    implements $CountryDetailModelCopyWith<$Res> {
  _$CountryDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      code2Iso: freezed == code2Iso
          ? _value.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryDetailModelImplCopyWith<$Res>
    implements $CountryDetailModelCopyWith<$Res> {
  factory _$$CountryDetailModelImplCopyWith(_$CountryDetailModelImpl value,
          $Res Function(_$CountryDetailModelImpl) then) =
      __$$CountryDetailModelImplCopyWithImpl<$Res>;
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
class __$$CountryDetailModelImplCopyWithImpl<$Res>
    extends _$CountryDetailModelCopyWithImpl<$Res, _$CountryDetailModelImpl>
    implements _$$CountryDetailModelImplCopyWith<$Res> {
  __$$CountryDetailModelImplCopyWithImpl(_$CountryDetailModelImpl _value,
      $Res Function(_$CountryDetailModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$CountryDetailModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      code2Iso: freezed == code2Iso
          ? _value.code2Iso
          : code2Iso // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$CountryDetailModelImpl implements _CountryDetailModel {
  _$CountryDetailModelImpl(
      {this.code,
      this.code2Iso,
      this.name,
      this.phoneCode,
      this.currency,
      final List<String>? cities})
      : _cities = cities;

  factory _$CountryDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryDetailModelImplFromJson(json);

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

  @override
  String toString() {
    return 'CountryDetailModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryDetailModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, code2Iso, name, phoneCode,
      currency, const DeepCollectionEquality().hash(_cities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDetailModelImplCopyWith<_$CountryDetailModelImpl> get copyWith =>
      __$$CountryDetailModelImplCopyWithImpl<_$CountryDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryDetailModelImplToJson(
      this,
    );
  }
}

abstract class _CountryDetailModel implements CountryDetailModel {
  factory _CountryDetailModel(
      {final String? code,
      final String? code2Iso,
      final String? name,
      final String? phoneCode,
      final String? currency,
      final List<String>? cities}) = _$CountryDetailModelImpl;

  factory _CountryDetailModel.fromJson(Map<String, dynamic> json) =
      _$CountryDetailModelImpl.fromJson;

  @override
  String? get code;
  @override
  String? get code2Iso;
  @override
  String? get name;
  @override
  String? get phoneCode;
  @override
  String? get currency;
  @override
  List<String>? get cities;
  @override
  @JsonKey(ignore: true)
  _$$CountryDetailModelImplCopyWith<_$CountryDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
