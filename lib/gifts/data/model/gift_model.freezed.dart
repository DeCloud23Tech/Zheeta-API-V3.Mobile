// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiftModel _$GiftModelFromJson(Map<String, dynamic> json) {
  return _GiftModel.fromJson(json);
}

/// @nodoc
mixin _$GiftModel {
  String get imageUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get partitionKey => throw _privateConstructorUsedError;
  String? get lastModifiedDate => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftModelCopyWith<GiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftModelCopyWith<$Res> {
  factory $GiftModelCopyWith(GiftModel value, $Res Function(GiftModel) then) =
      _$GiftModelCopyWithImpl<$Res, GiftModel>;
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
class _$GiftModelCopyWithImpl<$Res, $Val extends GiftModel>
    implements $GiftModelCopyWith<$Res> {
  _$GiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _value.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftModelImplCopyWith<$Res>
    implements $GiftModelCopyWith<$Res> {
  factory _$$GiftModelImplCopyWith(
          _$GiftModelImpl value, $Res Function(_$GiftModelImpl) then) =
      __$$GiftModelImplCopyWithImpl<$Res>;
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
class __$$GiftModelImplCopyWithImpl<$Res>
    extends _$GiftModelCopyWithImpl<$Res, _$GiftModelImpl>
    implements _$$GiftModelImplCopyWith<$Res> {
  __$$GiftModelImplCopyWithImpl(
      _$GiftModelImpl _value, $Res Function(_$GiftModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$GiftModelImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _value.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftModelImpl implements _GiftModel {
  _$GiftModelImpl(
      {required this.imageUrl,
      required this.title,
      required this.amount,
      required this.id,
      required this.partitionKey,
      this.lastModifiedDate,
      this.createdDate});

  factory _$GiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftModelImplFromJson(json);

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

  @override
  String toString() {
    return 'GiftModel(imageUrl: $imageUrl, title: $title, amount: $amount, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, title, amount, id,
      partitionKey, lastModifiedDate, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftModelImplCopyWith<_$GiftModelImpl> get copyWith =>
      __$$GiftModelImplCopyWithImpl<_$GiftModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftModelImplToJson(
      this,
    );
  }
}

abstract class _GiftModel implements GiftModel {
  factory _GiftModel(
      {required final String imageUrl,
      required final String title,
      required final double amount,
      required final String id,
      required final String partitionKey,
      final String? lastModifiedDate,
      final String? createdDate}) = _$GiftModelImpl;

  factory _GiftModel.fromJson(Map<String, dynamic> json) =
      _$GiftModelImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String get title;
  @override
  double get amount;
  @override
  String get id;
  @override
  String get partitionKey;
  @override
  String? get lastModifiedDate;
  @override
  String? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$GiftModelImplCopyWith<_$GiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiftListModel _$GiftListModelFromJson(Map<String, dynamic> json) {
  return _GiftListModel.fromJson(json);
}

/// @nodoc
mixin _$GiftListModel {
  List<GiftModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftListModelCopyWith<GiftListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftListModelCopyWith<$Res> {
  factory $GiftListModelCopyWith(
          GiftListModel value, $Res Function(GiftListModel) then) =
      _$GiftListModelCopyWithImpl<$Res, GiftListModel>;
  @useResult
  $Res call({List<GiftModel> data});
}

/// @nodoc
class _$GiftListModelCopyWithImpl<$Res, $Val extends GiftListModel>
    implements $GiftListModelCopyWith<$Res> {
  _$GiftListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GiftModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftListModelImplCopyWith<$Res>
    implements $GiftListModelCopyWith<$Res> {
  factory _$$GiftListModelImplCopyWith(
          _$GiftListModelImpl value, $Res Function(_$GiftListModelImpl) then) =
      __$$GiftListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GiftModel> data});
}

/// @nodoc
class __$$GiftListModelImplCopyWithImpl<$Res>
    extends _$GiftListModelCopyWithImpl<$Res, _$GiftListModelImpl>
    implements _$$GiftListModelImplCopyWith<$Res> {
  __$$GiftListModelImplCopyWithImpl(
      _$GiftListModelImpl _value, $Res Function(_$GiftListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GiftListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GiftModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftListModelImpl implements _GiftListModel {
  _$GiftListModelImpl({required final List<GiftModel> data}) : _data = data;

  factory _$GiftListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftListModelImplFromJson(json);

  final List<GiftModel> _data;
  @override
  List<GiftModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GiftListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftListModelImplCopyWith<_$GiftListModelImpl> get copyWith =>
      __$$GiftListModelImplCopyWithImpl<_$GiftListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftListModelImplToJson(
      this,
    );
  }
}

abstract class _GiftListModel implements GiftListModel {
  factory _GiftListModel({required final List<GiftModel> data}) =
      _$GiftListModelImpl;

  factory _GiftListModel.fromJson(Map<String, dynamic> json) =
      _$GiftListModelImpl.fromJson;

  @override
  List<GiftModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$GiftListModelImplCopyWith<_$GiftListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
