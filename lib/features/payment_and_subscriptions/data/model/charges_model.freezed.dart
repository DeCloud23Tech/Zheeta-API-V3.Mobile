// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charges_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChargesListModel _$ChargesListModelFromJson(Map<String, dynamic> json) {
  return _ChargesListModel.fromJson(json);
}

/// @nodoc
mixin _$ChargesListModel {
  List<Charge> get data => throw _privateConstructorUsedError;

  /// Serializes this ChargesListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargesListModelCopyWith<ChargesListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargesListModelCopyWith<$Res> {
  factory $ChargesListModelCopyWith(
          ChargesListModel value, $Res Function(ChargesListModel) then) =
      _$ChargesListModelCopyWithImpl<$Res, ChargesListModel>;
  @useResult
  $Res call({List<Charge> data});
}

/// @nodoc
class _$ChargesListModelCopyWithImpl<$Res, $Val extends ChargesListModel>
    implements $ChargesListModelCopyWith<$Res> {
  _$ChargesListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Charge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargesListModelImplCopyWith<$Res>
    implements $ChargesListModelCopyWith<$Res> {
  factory _$$ChargesListModelImplCopyWith(_$ChargesListModelImpl value,
          $Res Function(_$ChargesListModelImpl) then) =
      __$$ChargesListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Charge> data});
}

/// @nodoc
class __$$ChargesListModelImplCopyWithImpl<$Res>
    extends _$ChargesListModelCopyWithImpl<$Res, _$ChargesListModelImpl>
    implements _$$ChargesListModelImplCopyWith<$Res> {
  __$$ChargesListModelImplCopyWithImpl(_$ChargesListModelImpl _value,
      $Res Function(_$ChargesListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ChargesListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Charge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargesListModelImpl implements _ChargesListModel {
  const _$ChargesListModelImpl({required final List<Charge> data})
      : _data = data;

  factory _$ChargesListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargesListModelImplFromJson(json);

  final List<Charge> _data;
  @override
  List<Charge> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChargesListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargesListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargesListModelImplCopyWith<_$ChargesListModelImpl> get copyWith =>
      __$$ChargesListModelImplCopyWithImpl<_$ChargesListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargesListModelImplToJson(
      this,
    );
  }
}

abstract class _ChargesListModel implements ChargesListModel {
  const factory _ChargesListModel({required final List<Charge> data}) =
      _$ChargesListModelImpl;

  factory _ChargesListModel.fromJson(Map<String, dynamic> json) =
      _$ChargesListModelImpl.fromJson;

  @override
  List<Charge> get data;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargesListModelImplCopyWith<_$ChargesListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Charge _$ChargeFromJson(Map<String, dynamic> json) {
  return _Charge.fromJson(json);
}

/// @nodoc
mixin _$Charge {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get lastModifiedDate => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;

  /// Serializes this Charge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargeCopyWith<Charge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeCopyWith<$Res> {
  factory $ChargeCopyWith(Charge value, $Res Function(Charge) then) =
      _$ChargeCopyWithImpl<$Res, Charge>;
  @useResult
  $Res call(
      {int id,
      String title,
      double amount,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class _$ChargeCopyWithImpl<$Res, $Val extends Charge>
    implements $ChargeCopyWith<$Res> {
  _$ChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargeImplCopyWith<$Res> implements $ChargeCopyWith<$Res> {
  factory _$$ChargeImplCopyWith(
          _$ChargeImpl value, $Res Function(_$ChargeImpl) then) =
      __$$ChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      double amount,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class __$$ChargeImplCopyWithImpl<$Res>
    extends _$ChargeCopyWithImpl<$Res, _$ChargeImpl>
    implements _$$ChargeImplCopyWith<$Res> {
  __$$ChargeImplCopyWithImpl(
      _$ChargeImpl _value, $Res Function(_$ChargeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_$ChargeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargeImpl implements _Charge {
  const _$ChargeImpl(
      {required this.id,
      required this.title,
      required this.amount,
      required this.lastModifiedDate,
      required this.createdDate});

  factory _$ChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargeImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final double amount;
  @override
  final DateTime lastModifiedDate;
  @override
  final DateTime createdDate;

  @override
  String toString() {
    return 'Charge(id: $id, title: $title, amount: $amount, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, amount, lastModifiedDate, createdDate);

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargeImplCopyWith<_$ChargeImpl> get copyWith =>
      __$$ChargeImplCopyWithImpl<_$ChargeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargeImplToJson(
      this,
    );
  }
}

abstract class _Charge implements Charge {
  const factory _Charge(
      {required final int id,
      required final String title,
      required final double amount,
      required final DateTime lastModifiedDate,
      required final DateTime createdDate}) = _$ChargeImpl;

  factory _Charge.fromJson(Map<String, dynamic> json) = _$ChargeImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  double get amount;
  @override
  DateTime get lastModifiedDate;
  @override
  DateTime get createdDate;

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargeImplCopyWith<_$ChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
