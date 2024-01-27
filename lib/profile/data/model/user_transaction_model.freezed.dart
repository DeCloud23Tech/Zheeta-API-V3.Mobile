// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTransactionModel _$UserTransactionModelFromJson(Map<String, dynamic> json) {
  return _UserTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$UserTransactionModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;
  dynamic get fromUsername => throw _privateConstructorUsedError;
  dynamic get amount => throw _privateConstructorUsedError;
  dynamic get transactionType => throw _privateConstructorUsedError;
  dynamic get lastModifiedDate => throw _privateConstructorUsedError;
  dynamic get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTransactionModelCopyWith<UserTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTransactionModelCopyWith<$Res> {
  factory $UserTransactionModelCopyWith(UserTransactionModel value,
          $Res Function(UserTransactionModel) then) =
      _$UserTransactionModelCopyWithImpl<$Res, UserTransactionModel>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic title,
      dynamic fromUsername,
      dynamic amount,
      dynamic transactionType,
      dynamic lastModifiedDate,
      dynamic createdDate});
}

/// @nodoc
class _$UserTransactionModelCopyWithImpl<$Res,
        $Val extends UserTransactionModel>
    implements $UserTransactionModelCopyWith<$Res> {
  _$UserTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? fromUsername = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fromUsername: freezed == fromUsername
          ? _value.fromUsername
          : fromUsername // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTransactionModelImplCopyWith<$Res>
    implements $UserTransactionModelCopyWith<$Res> {
  factory _$$UserTransactionModelImplCopyWith(_$UserTransactionModelImpl value,
          $Res Function(_$UserTransactionModelImpl) then) =
      __$$UserTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic title,
      dynamic fromUsername,
      dynamic amount,
      dynamic transactionType,
      dynamic lastModifiedDate,
      dynamic createdDate});
}

/// @nodoc
class __$$UserTransactionModelImplCopyWithImpl<$Res>
    extends _$UserTransactionModelCopyWithImpl<$Res, _$UserTransactionModelImpl>
    implements _$$UserTransactionModelImplCopyWith<$Res> {
  __$$UserTransactionModelImplCopyWithImpl(_$UserTransactionModelImpl _value,
      $Res Function(_$UserTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? fromUsername = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$UserTransactionModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fromUsername: freezed == fromUsername
          ? _value.fromUsername
          : fromUsername // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$UserTransactionModelImpl implements _UserTransactionModel {
  _$UserTransactionModelImpl(
      {this.userId,
      this.title,
      this.fromUsername,
      this.amount,
      this.transactionType,
      this.lastModifiedDate,
      this.createdDate});

  factory _$UserTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTransactionModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic title;
  @override
  final dynamic fromUsername;
  @override
  final dynamic amount;
  @override
  final dynamic transactionType;
  @override
  final dynamic lastModifiedDate;
  @override
  final dynamic createdDate;

  @override
  String toString() {
    return 'UserTransactionModel(userId: $userId, title: $title, fromUsername: $fromUsername, amount: $amount, transactionType: $transactionType, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.fromUsername, fromUsername) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType) &&
            const DeepCollectionEquality()
                .equals(other.lastModifiedDate, lastModifiedDate) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(fromUsername),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(transactionType),
      const DeepCollectionEquality().hash(lastModifiedDate),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTransactionModelImplCopyWith<_$UserTransactionModelImpl>
      get copyWith =>
          __$$UserTransactionModelImplCopyWithImpl<_$UserTransactionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _UserTransactionModel implements UserTransactionModel {
  factory _UserTransactionModel(
      {final dynamic userId,
      final dynamic title,
      final dynamic fromUsername,
      final dynamic amount,
      final dynamic transactionType,
      final dynamic lastModifiedDate,
      final dynamic createdDate}) = _$UserTransactionModelImpl;

  factory _UserTransactionModel.fromJson(Map<String, dynamic> json) =
      _$UserTransactionModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get title;
  @override
  dynamic get fromUsername;
  @override
  dynamic get amount;
  @override
  dynamic get transactionType;
  @override
  dynamic get lastModifiedDate;
  @override
  dynamic get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$UserTransactionModelImplCopyWith<_$UserTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserTransactionListModel _$UserTransactionListModelFromJson(
    Map<String, dynamic> json) {
  return _UserTransactionListModel.fromJson(json);
}

/// @nodoc
mixin _$UserTransactionListModel {
  List<UserTransactionModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTransactionListModelCopyWith<UserTransactionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTransactionListModelCopyWith<$Res> {
  factory $UserTransactionListModelCopyWith(UserTransactionListModel value,
          $Res Function(UserTransactionListModel) then) =
      _$UserTransactionListModelCopyWithImpl<$Res, UserTransactionListModel>;
  @useResult
  $Res call({List<UserTransactionModel>? data});
}

/// @nodoc
class _$UserTransactionListModelCopyWithImpl<$Res,
        $Val extends UserTransactionListModel>
    implements $UserTransactionListModelCopyWith<$Res> {
  _$UserTransactionListModelCopyWithImpl(this._value, this._then);

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
              as List<UserTransactionModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTransactionListModelImplCopyWith<$Res>
    implements $UserTransactionListModelCopyWith<$Res> {
  factory _$$UserTransactionListModelImplCopyWith(
          _$UserTransactionListModelImpl value,
          $Res Function(_$UserTransactionListModelImpl) then) =
      __$$UserTransactionListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserTransactionModel>? data});
}

/// @nodoc
class __$$UserTransactionListModelImplCopyWithImpl<$Res>
    extends _$UserTransactionListModelCopyWithImpl<$Res,
        _$UserTransactionListModelImpl>
    implements _$$UserTransactionListModelImplCopyWith<$Res> {
  __$$UserTransactionListModelImplCopyWithImpl(
      _$UserTransactionListModelImpl _value,
      $Res Function(_$UserTransactionListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$UserTransactionListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserTransactionModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserTransactionListModelImpl implements _UserTransactionListModel {
  _$UserTransactionListModelImpl({final List<UserTransactionModel>? data})
      : _data = data;

  factory _$UserTransactionListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTransactionListModelImplFromJson(json);

  final List<UserTransactionModel>? _data;
  @override
  List<UserTransactionModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserTransactionListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTransactionListModelImplCopyWith<_$UserTransactionListModelImpl>
      get copyWith => __$$UserTransactionListModelImplCopyWithImpl<
          _$UserTransactionListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTransactionListModelImplToJson(
      this,
    );
  }
}

abstract class _UserTransactionListModel implements UserTransactionListModel {
  factory _UserTransactionListModel({final List<UserTransactionModel>? data}) =
      _$UserTransactionListModelImpl;

  factory _UserTransactionListModel.fromJson(Map<String, dynamic> json) =
      _$UserTransactionListModelImpl.fromJson;

  @override
  List<UserTransactionModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$UserTransactionListModelImplCopyWith<_$UserTransactionListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
