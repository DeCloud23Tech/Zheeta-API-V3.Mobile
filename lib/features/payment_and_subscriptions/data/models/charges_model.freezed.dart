// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charges_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChargesListModel {
  List<Charge> get data;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChargesListModelCopyWith<ChargesListModel> get copyWith =>
      _$ChargesListModelCopyWithImpl<ChargesListModel>(
          this as ChargesListModel, _$identity);

  /// Serializes this ChargesListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChargesListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ChargesListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ChargesListModelCopyWith<$Res> {
  factory $ChargesListModelCopyWith(
          ChargesListModel value, $Res Function(ChargesListModel) _then) =
      _$ChargesListModelCopyWithImpl;
  @useResult
  $Res call({List<Charge> data});
}

/// @nodoc
class _$ChargesListModelCopyWithImpl<$Res>
    implements $ChargesListModelCopyWith<$Res> {
  _$ChargesListModelCopyWithImpl(this._self, this._then);

  final ChargesListModel _self;
  final $Res Function(ChargesListModel) _then;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Charge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChargesListModel implements ChargesListModel {
  const _ChargesListModel({required final List<Charge> data}) : _data = data;
  factory _ChargesListModel.fromJson(Map<String, dynamic> json) =>
      _$ChargesListModelFromJson(json);

  final List<Charge> _data;
  @override
  List<Charge> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChargesListModelCopyWith<_ChargesListModel> get copyWith =>
      __$ChargesListModelCopyWithImpl<_ChargesListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChargesListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChargesListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ChargesListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ChargesListModelCopyWith<$Res>
    implements $ChargesListModelCopyWith<$Res> {
  factory _$ChargesListModelCopyWith(
          _ChargesListModel value, $Res Function(_ChargesListModel) _then) =
      __$ChargesListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<Charge> data});
}

/// @nodoc
class __$ChargesListModelCopyWithImpl<$Res>
    implements _$ChargesListModelCopyWith<$Res> {
  __$ChargesListModelCopyWithImpl(this._self, this._then);

  final _ChargesListModel _self;
  final $Res Function(_ChargesListModel) _then;

  /// Create a copy of ChargesListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_ChargesListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Charge>,
    ));
  }
}

/// @nodoc
mixin _$Charge {
  int get id;
  String get title;
  double get amount;
  DateTime get lastModifiedDate;
  DateTime get createdDate;

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChargeCopyWith<Charge> get copyWith =>
      _$ChargeCopyWithImpl<Charge>(this as Charge, _$identity);

  /// Serializes this Charge to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Charge &&
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

  @override
  String toString() {
    return 'Charge(id: $id, title: $title, amount: $amount, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $ChargeCopyWith<$Res> {
  factory $ChargeCopyWith(Charge value, $Res Function(Charge) _then) =
      _$ChargeCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      double amount,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class _$ChargeCopyWithImpl<$Res> implements $ChargeCopyWith<$Res> {
  _$ChargeCopyWithImpl(this._self, this._then);

  final Charge _self;
  final $Res Function(Charge) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastModifiedDate: null == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Charge implements Charge {
  const _Charge(
      {required this.id,
      required this.title,
      required this.amount,
      required this.lastModifiedDate,
      required this.createdDate});
  factory _Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);

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

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChargeCopyWith<_Charge> get copyWith =>
      __$ChargeCopyWithImpl<_Charge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChargeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Charge &&
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

  @override
  String toString() {
    return 'Charge(id: $id, title: $title, amount: $amount, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$ChargeCopyWith<$Res> implements $ChargeCopyWith<$Res> {
  factory _$ChargeCopyWith(_Charge value, $Res Function(_Charge) _then) =
      __$ChargeCopyWithImpl;
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
class __$ChargeCopyWithImpl<$Res> implements _$ChargeCopyWith<$Res> {
  __$ChargeCopyWithImpl(this._self, this._then);

  final _Charge _self;
  final $Res Function(_Charge) _then;

  /// Create a copy of Charge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_Charge(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      lastModifiedDate: null == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
