// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentType {
  int get id;
  String get name;

  /// Create a copy of PaymentType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentTypeCopyWith<PaymentType> get copyWith =>
      _$PaymentTypeCopyWithImpl<PaymentType>(this as PaymentType, _$identity);

  /// Serializes this PaymentType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PaymentType(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $PaymentTypeCopyWith<$Res> {
  factory $PaymentTypeCopyWith(
          PaymentType value, $Res Function(PaymentType) _then) =
      _$PaymentTypeCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$PaymentTypeCopyWithImpl<$Res> implements $PaymentTypeCopyWith<$Res> {
  _$PaymentTypeCopyWithImpl(this._self, this._then);

  final PaymentType _self;
  final $Res Function(PaymentType) _then;

  /// Create a copy of PaymentType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentType implements PaymentType {
  _PaymentType({required this.id, required this.name});
  factory _PaymentType.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of PaymentType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentTypeCopyWith<_PaymentType> get copyWith =>
      __$PaymentTypeCopyWithImpl<_PaymentType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'PaymentType(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$PaymentTypeCopyWith<$Res>
    implements $PaymentTypeCopyWith<$Res> {
  factory _$PaymentTypeCopyWith(
          _PaymentType value, $Res Function(_PaymentType) _then) =
      __$PaymentTypeCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$PaymentTypeCopyWithImpl<$Res> implements _$PaymentTypeCopyWith<$Res> {
  __$PaymentTypeCopyWithImpl(this._self, this._then);

  final _PaymentType _self;
  final $Res Function(_PaymentType) _then;

  /// Create a copy of PaymentType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_PaymentType(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
