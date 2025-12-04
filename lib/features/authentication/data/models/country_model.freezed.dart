// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryModel {
  String? get code;
  String? get code2Iso;
  String? get name;
  String? get phoneCode;
  String? get currency;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<CountryModel> get copyWith =>
      _$CountryModelCopyWithImpl<CountryModel>(
          this as CountryModel, _$identity);

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryModel &&
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
    return 'CountryModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) _then) =
      _$CountryModelCopyWithImpl;
  @useResult
  $Res call(
      {String? code,
      String? code2Iso,
      String? name,
      String? phoneCode,
      String? currency});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res> implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._self, this._then);

  final CountryModel _self;
  final $Res Function(CountryModel) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? code2Iso = freezed,
    Object? name = freezed,
    Object? phoneCode = freezed,
    Object? currency = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CountryModel implements CountryModel {
  _CountryModel(
      {this.code, this.code2Iso, this.name, this.phoneCode, this.currency});
  factory _CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

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

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryModelCopyWith<_CountryModel> get copyWith =>
      __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryModel &&
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
    return 'CountryModel(code: $code, code2Iso: $code2Iso, name: $name, phoneCode: $phoneCode, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$CountryModelCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(
          _CountryModel value, $Res Function(_CountryModel) _then) =
      __$CountryModelCopyWithImpl;
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
class __$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(this._self, this._then);

  final _CountryModel _self;
  final $Res Function(_CountryModel) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? code2Iso = freezed,
    Object? name = freezed,
    Object? phoneCode = freezed,
    Object? currency = freezed,
  }) {
    return _then(_CountryModel(
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
    ));
  }
}

/// @nodoc
mixin _$CountryListModel {
  List<CountryModel>? get data;

  /// Create a copy of CountryListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountryListModelCopyWith<CountryListModel> get copyWith =>
      _$CountryListModelCopyWithImpl<CountryListModel>(
          this as CountryListModel, _$identity);

  /// Serializes this CountryListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountryListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'CountryListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $CountryListModelCopyWith<$Res> {
  factory $CountryListModelCopyWith(
          CountryListModel value, $Res Function(CountryListModel) _then) =
      _$CountryListModelCopyWithImpl;
  @useResult
  $Res call({List<CountryModel>? data});
}

/// @nodoc
class _$CountryListModelCopyWithImpl<$Res>
    implements $CountryListModelCopyWith<$Res> {
  _$CountryListModelCopyWithImpl(this._self, this._then);

  final CountryListModel _self;
  final $Res Function(CountryListModel) _then;

  /// Create a copy of CountryListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CountryListModel implements CountryListModel {
  _CountryListModel({final List<CountryModel>? data}) : _data = data;
  factory _CountryListModel.fromJson(Map<String, dynamic> json) =>
      _$CountryListModelFromJson(json);

  final List<CountryModel>? _data;
  @override
  List<CountryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CountryListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountryListModelCopyWith<_CountryListModel> get copyWith =>
      __$CountryListModelCopyWithImpl<_CountryListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CountryListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountryListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'CountryListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$CountryListModelCopyWith<$Res>
    implements $CountryListModelCopyWith<$Res> {
  factory _$CountryListModelCopyWith(
          _CountryListModel value, $Res Function(_CountryListModel) _then) =
      __$CountryListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<CountryModel>? data});
}

/// @nodoc
class __$CountryListModelCopyWithImpl<$Res>
    implements _$CountryListModelCopyWith<$Res> {
  __$CountryListModelCopyWithImpl(this._self, this._then);

  final _CountryListModel _self;
  final $Res Function(_CountryListModel) _then;

  /// Create a copy of CountryListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_CountryListModel(
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
    ));
  }
}

// dart format on
