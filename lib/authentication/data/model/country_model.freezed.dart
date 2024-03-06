// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  String? get code => throw _privateConstructorUsedError;
  String? get code2Iso => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res, CountryModel>;
  @useResult
  $Res call(
      {String? code,
      String? code2Iso,
      String? name,
      String? phoneCode,
      String? currency});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res, $Val extends CountryModel>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
          _$CountryModelImpl value, $Res Function(_$CountryModelImpl) then) =
      __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? code2Iso,
      String? name,
      String? phoneCode,
      String? currency});
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
      _$CountryModelImpl _value, $Res Function(_$CountryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? code2Iso = freezed,
    Object? name = freezed,
    Object? phoneCode = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$CountryModelImpl(
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
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$CountryModelImpl implements _CountryModel {
  _$CountryModelImpl(
      {this.code, this.code2Iso, this.name, this.phoneCode, this.currency});

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

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

  @override
  String toString() {
    return 'CountryModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.code2Iso, code2Iso) ||
                other.code2Iso == code2Iso) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, code2Iso, name, phoneCode, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(
      this,
    );
  }
}

abstract class _CountryModel implements CountryModel {
  factory _CountryModel(
      {final String? code,
      final String? code2Iso,
      final String? name,
      final String? phoneCode,
      final String? currency}) = _$CountryModelImpl;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) {
  return _CountryListModel.fromJson(json);
}

/// @nodoc
mixin _$CountryListModel {
  List<CountryModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryListModelCopyWith<CountryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryListModelCopyWith<$Res> {
  factory $CountryListModelCopyWith(
          CountryListModel value, $Res Function(CountryListModel) then) =
      _$CountryListModelCopyWithImpl<$Res, CountryListModel>;
  @useResult
  $Res call({List<CountryModel>? data});
}

/// @nodoc
class _$CountryListModelCopyWithImpl<$Res, $Val extends CountryListModel>
    implements $CountryListModelCopyWith<$Res> {
  _$CountryListModelCopyWithImpl(this._value, this._then);

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
              as List<CountryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryListModelImplCopyWith<$Res>
    implements $CountryListModelCopyWith<$Res> {
  factory _$$CountryListModelImplCopyWith(_$CountryListModelImpl value,
          $Res Function(_$CountryListModelImpl) then) =
      __$$CountryListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CountryModel>? data});
}

/// @nodoc
class __$$CountryListModelImplCopyWithImpl<$Res>
    extends _$CountryListModelCopyWithImpl<$Res, _$CountryListModelImpl>
    implements _$$CountryListModelImplCopyWith<$Res> {
  __$$CountryListModelImplCopyWithImpl(_$CountryListModelImpl _value,
      $Res Function(_$CountryListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CountryListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CountryListModelImpl implements _CountryListModel {
  _$CountryListModelImpl({final List<CountryModel>? data}) : _data = data;

  factory _$CountryListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryListModelImplFromJson(json);

  final List<CountryModel>? _data;
  @override
  List<CountryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountryListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryListModelImplCopyWith<_$CountryListModelImpl> get copyWith =>
      __$$CountryListModelImplCopyWithImpl<_$CountryListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryListModelImplToJson(
      this,
    );
  }
}

abstract class _CountryListModel implements CountryListModel {
  factory _CountryListModel({final List<CountryModel>? data}) =
      _$CountryListModelImpl;

  factory _CountryListModel.fromJson(Map<String, dynamic> json) =
      _$CountryListModelImpl.fromJson;

  @override
  List<CountryModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CountryListModelImplCopyWith<_$CountryListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
