// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_friend_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulkFriendRequestModel {
  String get recieverId;
  int get typeOfRequest;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BulkFriendRequestModelCopyWith<BulkFriendRequestModel> get copyWith =>
      _$BulkFriendRequestModelCopyWithImpl<BulkFriendRequestModel>(
          this as BulkFriendRequestModel, _$identity);

  /// Serializes this BulkFriendRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BulkFriendRequestModel &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.typeOfRequest, typeOfRequest) ||
                other.typeOfRequest == typeOfRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recieverId, typeOfRequest);

  @override
  String toString() {
    return 'BulkFriendRequestModel(recieverId: $recieverId, typeOfRequest: $typeOfRequest)';
  }
}

/// @nodoc
abstract mixin class $BulkFriendRequestModelCopyWith<$Res> {
  factory $BulkFriendRequestModelCopyWith(BulkFriendRequestModel value,
          $Res Function(BulkFriendRequestModel) _then) =
      _$BulkFriendRequestModelCopyWithImpl;
  @useResult
  $Res call({String recieverId, int typeOfRequest});
}

/// @nodoc
class _$BulkFriendRequestModelCopyWithImpl<$Res>
    implements $BulkFriendRequestModelCopyWith<$Res> {
  _$BulkFriendRequestModelCopyWithImpl(this._self, this._then);

  final BulkFriendRequestModel _self;
  final $Res Function(BulkFriendRequestModel) _then;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recieverId = null,
    Object? typeOfRequest = null,
  }) {
    return _then(_self.copyWith(
      recieverId: null == recieverId
          ? _self.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfRequest: null == typeOfRequest
          ? _self.typeOfRequest
          : typeOfRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BulkFriendRequestModel implements BulkFriendRequestModel {
  _BulkFriendRequestModel(
      {required this.recieverId, required this.typeOfRequest});
  factory _BulkFriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BulkFriendRequestModelFromJson(json);

  @override
  final String recieverId;
  @override
  final int typeOfRequest;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BulkFriendRequestModelCopyWith<_BulkFriendRequestModel> get copyWith =>
      __$BulkFriendRequestModelCopyWithImpl<_BulkFriendRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BulkFriendRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BulkFriendRequestModel &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.typeOfRequest, typeOfRequest) ||
                other.typeOfRequest == typeOfRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recieverId, typeOfRequest);

  @override
  String toString() {
    return 'BulkFriendRequestModel(recieverId: $recieverId, typeOfRequest: $typeOfRequest)';
  }
}

/// @nodoc
abstract mixin class _$BulkFriendRequestModelCopyWith<$Res>
    implements $BulkFriendRequestModelCopyWith<$Res> {
  factory _$BulkFriendRequestModelCopyWith(_BulkFriendRequestModel value,
          $Res Function(_BulkFriendRequestModel) _then) =
      __$BulkFriendRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String recieverId, int typeOfRequest});
}

/// @nodoc
class __$BulkFriendRequestModelCopyWithImpl<$Res>
    implements _$BulkFriendRequestModelCopyWith<$Res> {
  __$BulkFriendRequestModelCopyWithImpl(this._self, this._then);

  final _BulkFriendRequestModel _self;
  final $Res Function(_BulkFriendRequestModel) _then;

  /// Create a copy of BulkFriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recieverId = null,
    Object? typeOfRequest = null,
  }) {
    return _then(_BulkFriendRequestModel(
      recieverId: null == recieverId
          ? _self.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfRequest: null == typeOfRequest
          ? _self.typeOfRequest
          : typeOfRequest // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
