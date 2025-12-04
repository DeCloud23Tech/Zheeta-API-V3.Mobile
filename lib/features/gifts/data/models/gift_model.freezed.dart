// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftModel {
  String get imageUrl;
  String get title;
  double get amount;
  String get id;
  String get partitionKey;
  String? get lastModifiedDate;
  String? get createdDate;

  /// Create a copy of GiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GiftModelCopyWith<GiftModel> get copyWith =>
      _$GiftModelCopyWithImpl<GiftModel>(this as GiftModel, _$identity);

  /// Serializes this GiftModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GiftModel &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partitionKey, partitionKey) ||
                other.partitionKey == partitionKey) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, amount, id,
      partitionKey, lastModifiedDate, createdDate);

  @override
  String toString() {
    return 'GiftModel(imageUrl: $imageUrl, title: $title, amount: $amount, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $GiftModelCopyWith<$Res> {
  factory $GiftModelCopyWith(GiftModel value, $Res Function(GiftModel) _then) =
      _$GiftModelCopyWithImpl;
  @useResult
  $Res call(
      {String imageUrl,
      String title,
      double amount,
      String id,
      String partitionKey,
      String? lastModifiedDate,
      String? createdDate});
}

/// @nodoc
class _$GiftModelCopyWithImpl<$Res> implements $GiftModelCopyWith<$Res> {
  _$GiftModelCopyWithImpl(this._self, this._then);

  final GiftModel _self;
  final $Res Function(GiftModel) _then;

  /// Create a copy of GiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? title = null,
    Object? amount = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GiftModel implements GiftModel {
  _GiftModel(
      {required this.imageUrl,
      required this.title,
      required this.amount,
      required this.id,
      required this.partitionKey,
      this.lastModifiedDate,
      this.createdDate});
  factory _GiftModel.fromJson(Map<String, dynamic> json) =>
      _$GiftModelFromJson(json);

  @override
  final String imageUrl;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String id;
  @override
  final String partitionKey;
  @override
  final String? lastModifiedDate;
  @override
  final String? createdDate;

  /// Create a copy of GiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GiftModelCopyWith<_GiftModel> get copyWith =>
      __$GiftModelCopyWithImpl<_GiftModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GiftModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GiftModel &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partitionKey, partitionKey) ||
                other.partitionKey == partitionKey) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, amount, id,
      partitionKey, lastModifiedDate, createdDate);

  @override
  String toString() {
    return 'GiftModel(imageUrl: $imageUrl, title: $title, amount: $amount, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$GiftModelCopyWith<$Res>
    implements $GiftModelCopyWith<$Res> {
  factory _$GiftModelCopyWith(
          _GiftModel value, $Res Function(_GiftModel) _then) =
      __$GiftModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String imageUrl,
      String title,
      double amount,
      String id,
      String partitionKey,
      String? lastModifiedDate,
      String? createdDate});
}

/// @nodoc
class __$GiftModelCopyWithImpl<$Res> implements _$GiftModelCopyWith<$Res> {
  __$GiftModelCopyWithImpl(this._self, this._then);

  final _GiftModel _self;
  final $Res Function(_GiftModel) _then;

  /// Create a copy of GiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrl = null,
    Object? title = null,
    Object? amount = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_GiftModel(
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
