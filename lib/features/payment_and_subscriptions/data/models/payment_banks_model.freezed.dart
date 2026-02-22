// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_banks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankProvider {
  String get code;
  String get name;

  /// Create a copy of BankProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankProviderCopyWith<BankProvider> get copyWith =>
      _$BankProviderCopyWithImpl<BankProvider>(
          this as BankProvider, _$identity);

  /// Serializes this BankProvider to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankProvider &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'BankProvider(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class $BankProviderCopyWith<$Res> {
  factory $BankProviderCopyWith(
          BankProvider value, $Res Function(BankProvider) _then) =
      _$BankProviderCopyWithImpl;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$BankProviderCopyWithImpl<$Res> implements $BankProviderCopyWith<$Res> {
  _$BankProviderCopyWithImpl(this._self, this._then);

  final BankProvider _self;
  final $Res Function(BankProvider) _then;

  /// Create a copy of BankProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BankProvider implements BankProvider {
  const _BankProvider({required this.code, required this.name});
  factory _BankProvider.fromJson(Map<String, dynamic> json) =>
      _$BankProviderFromJson(json);

  @override
  final String code;
  @override
  final String name;

  /// Create a copy of BankProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankProviderCopyWith<_BankProvider> get copyWith =>
      __$BankProviderCopyWithImpl<_BankProvider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankProviderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankProvider &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @override
  String toString() {
    return 'BankProvider(code: $code, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$BankProviderCopyWith<$Res>
    implements $BankProviderCopyWith<$Res> {
  factory _$BankProviderCopyWith(
          _BankProvider value, $Res Function(_BankProvider) _then) =
      __$BankProviderCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$BankProviderCopyWithImpl<$Res>
    implements _$BankProviderCopyWith<$Res> {
  __$BankProviderCopyWithImpl(this._self, this._then);

  final _BankProvider _self;
  final $Res Function(_BankProvider) _then;

  /// Create a copy of BankProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_BankProvider(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
