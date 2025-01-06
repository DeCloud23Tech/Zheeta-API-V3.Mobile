// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_friend_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BulkFriendRequestModel _$BulkFriendRequestModelFromJson(
    Map<String, dynamic> json) {
  return _BulkFriendRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BulkFriendRequestModel {
  String get receiverId => throw _privateConstructorUsedError;
  int get typeOfRequest => throw _privateConstructorUsedError;

  /// Serializes this BulkFriendRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkFriendRequestModelCopyWith<BulkFriendRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkFriendRequestModelCopyWith<$Res> {
  factory $BulkFriendRequestModelCopyWith(BulkFriendRequestModel value,
          $Res Function(BulkFriendRequestModel) then) =
      _$BulkFriendRequestModelCopyWithImpl<$Res, BulkFriendRequestModel>;
  @useResult
  $Res call({String receiverId, int typeOfRequest});
}

/// @nodoc
class _$BulkFriendRequestModelCopyWithImpl<$Res,
        $Val extends BulkFriendRequestModel>
    implements $BulkFriendRequestModelCopyWith<$Res> {
  _$BulkFriendRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? typeOfRequest = null,
  }) {
    return _then(_value.copyWith(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfRequest: null == typeOfRequest
          ? _value.typeOfRequest
          : typeOfRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BulkFriendRequestModelImplCopyWith<$Res>
    implements $BulkFriendRequestModelCopyWith<$Res> {
  factory _$$BulkFriendRequestModelImplCopyWith(
          _$BulkFriendRequestModelImpl value,
          $Res Function(_$BulkFriendRequestModelImpl) then) =
      __$$BulkFriendRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String receiverId, int typeOfRequest});
}

/// @nodoc
class __$$BulkFriendRequestModelImplCopyWithImpl<$Res>
    extends _$BulkFriendRequestModelCopyWithImpl<$Res,
        _$BulkFriendRequestModelImpl>
    implements _$$BulkFriendRequestModelImplCopyWith<$Res> {
  __$$BulkFriendRequestModelImplCopyWithImpl(
      _$BulkFriendRequestModelImpl _value,
      $Res Function(_$BulkFriendRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? typeOfRequest = null,
  }) {
    return _then(_$BulkFriendRequestModelImpl(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfRequest: null == typeOfRequest
          ? _value.typeOfRequest
          : typeOfRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BulkFriendRequestModelImpl implements _BulkFriendRequestModel {
  _$BulkFriendRequestModelImpl(
      {required this.receiverId, required this.typeOfRequest});

  factory _$BulkFriendRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BulkFriendRequestModelImplFromJson(json);

  @override
  final String receiverId;
  @override
  final int typeOfRequest;

  @override
  String toString() {
    return 'BulkFriendRequestModel(receiverId: $receiverId, typeOfRequest: $typeOfRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkFriendRequestModelImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.typeOfRequest, typeOfRequest) ||
                other.typeOfRequest == typeOfRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, receiverId, typeOfRequest);

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkFriendRequestModelImplCopyWith<_$BulkFriendRequestModelImpl>
      get copyWith => __$$BulkFriendRequestModelImplCopyWithImpl<
          _$BulkFriendRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BulkFriendRequestModelImplToJson(
      this,
    );
  }
}

abstract class _BulkFriendRequestModel implements BulkFriendRequestModel {
  factory _BulkFriendRequestModel(
      {required final String receiverId,
      required final int typeOfRequest}) = _$BulkFriendRequestModelImpl;

  factory _BulkFriendRequestModel.fromJson(Map<String, dynamic> json) =
      _$BulkFriendRequestModelImpl.fromJson;

  @override
  String get receiverId;
  @override
  int get typeOfRequest;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BulkFriendRequestModelImplCopyWith<_$BulkFriendRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
