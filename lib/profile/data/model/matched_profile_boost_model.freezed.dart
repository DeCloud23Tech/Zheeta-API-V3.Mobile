// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchedProfileBoostModel _$MatchedProfileBoostModelFromJson(
    Map<String, dynamic> json) {
  return _MatchedProfileBoostModel.fromJson(json);
}

/// @nodoc
mixin _$MatchedProfileBoostModel {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get userName => throw _privateConstructorUsedError;
  dynamic get fullName => throw _privateConstructorUsedError;
  dynamic get profileUrlForAds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedProfileBoostModelCopyWith<MatchedProfileBoostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedProfileBoostModelCopyWith<$Res> {
  factory $MatchedProfileBoostModelCopyWith(MatchedProfileBoostModel value,
          $Res Function(MatchedProfileBoostModel) then) =
      _$MatchedProfileBoostModelCopyWithImpl<$Res, MatchedProfileBoostModel>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic fullName,
      dynamic profileUrlForAds});
}

/// @nodoc
class _$MatchedProfileBoostModelCopyWithImpl<$Res,
        $Val extends MatchedProfileBoostModel>
    implements $MatchedProfileBoostModelCopyWith<$Res> {
  _$MatchedProfileBoostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? profileUrlForAds = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileUrlForAds: freezed == profileUrlForAds
          ? _value.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchedProfileBoostModelImplCopyWith<$Res>
    implements $MatchedProfileBoostModelCopyWith<$Res> {
  factory _$$MatchedProfileBoostModelImplCopyWith(
          _$MatchedProfileBoostModelImpl value,
          $Res Function(_$MatchedProfileBoostModelImpl) then) =
      __$$MatchedProfileBoostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic userName,
      dynamic fullName,
      dynamic profileUrlForAds});
}

/// @nodoc
class __$$MatchedProfileBoostModelImplCopyWithImpl<$Res>
    extends _$MatchedProfileBoostModelCopyWithImpl<$Res,
        _$MatchedProfileBoostModelImpl>
    implements _$$MatchedProfileBoostModelImplCopyWith<$Res> {
  __$$MatchedProfileBoostModelImplCopyWithImpl(
      _$MatchedProfileBoostModelImpl _value,
      $Res Function(_$MatchedProfileBoostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? profileUrlForAds = freezed,
  }) {
    return _then(_$MatchedProfileBoostModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileUrlForAds: freezed == profileUrlForAds
          ? _value.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MatchedProfileBoostModelImpl implements _MatchedProfileBoostModel {
  const _$MatchedProfileBoostModelImpl(
      {this.userId, this.userName, this.fullName, this.profileUrlForAds});

  factory _$MatchedProfileBoostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchedProfileBoostModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic userName;
  @override
  final dynamic fullName;
  @override
  final dynamic profileUrlForAds;

  @override
  String toString() {
    return 'MatchedProfileBoostModel(userId: $userId, userName: $userName, fullName: $fullName, profileUrlForAds: $profileUrlForAds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedProfileBoostModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality()
                .equals(other.profileUrlForAds, profileUrlForAds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(profileUrlForAds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedProfileBoostModelImplCopyWith<_$MatchedProfileBoostModelImpl>
      get copyWith => __$$MatchedProfileBoostModelImplCopyWithImpl<
          _$MatchedProfileBoostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchedProfileBoostModelImplToJson(
      this,
    );
  }
}

abstract class _MatchedProfileBoostModel implements MatchedProfileBoostModel {
  const factory _MatchedProfileBoostModel(
      {final dynamic userId,
      final dynamic userName,
      final dynamic fullName,
      final dynamic profileUrlForAds}) = _$MatchedProfileBoostModelImpl;

  factory _MatchedProfileBoostModel.fromJson(Map<String, dynamic> json) =
      _$MatchedProfileBoostModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get userName;
  @override
  dynamic get fullName;
  @override
  dynamic get profileUrlForAds;
  @override
  @JsonKey(ignore: true)
  _$$MatchedProfileBoostModelImplCopyWith<_$MatchedProfileBoostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchedProfileBoostListModel _$MatchedProfileBoostListModelFromJson(
    Map<String, dynamic> json) {
  return _MatchedProfileBoostListModel.fromJson(json);
}

/// @nodoc
mixin _$MatchedProfileBoostListModel {
  List<MatchedProfileBoostModel>? get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedProfileBoostListModelCopyWith<MatchedProfileBoostListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedProfileBoostListModelCopyWith<$Res> {
  factory $MatchedProfileBoostListModelCopyWith(
          MatchedProfileBoostListModel value,
          $Res Function(MatchedProfileBoostListModel) then) =
      _$MatchedProfileBoostListModelCopyWithImpl<$Res,
          MatchedProfileBoostListModel>;
  @useResult
  $Res call({List<MatchedProfileBoostModel>? data});
}

/// @nodoc
class _$MatchedProfileBoostListModelCopyWithImpl<$Res,
        $Val extends MatchedProfileBoostListModel>
    implements $MatchedProfileBoostListModelCopyWith<$Res> {
  _$MatchedProfileBoostListModelCopyWithImpl(this._value, this._then);

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
              as List<MatchedProfileBoostModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchedProfileBoostListModelImplCopyWith<$Res>
    implements $MatchedProfileBoostListModelCopyWith<$Res> {
  factory _$$MatchedProfileBoostListModelImplCopyWith(
          _$MatchedProfileBoostListModelImpl value,
          $Res Function(_$MatchedProfileBoostListModelImpl) then) =
      __$$MatchedProfileBoostListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchedProfileBoostModel>? data});
}

/// @nodoc
class __$$MatchedProfileBoostListModelImplCopyWithImpl<$Res>
    extends _$MatchedProfileBoostListModelCopyWithImpl<$Res,
        _$MatchedProfileBoostListModelImpl>
    implements _$$MatchedProfileBoostListModelImplCopyWith<$Res> {
  __$$MatchedProfileBoostListModelImplCopyWithImpl(
      _$MatchedProfileBoostListModelImpl _value,
      $Res Function(_$MatchedProfileBoostListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$MatchedProfileBoostListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MatchedProfileBoostModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MatchedProfileBoostListModelImpl
    implements _MatchedProfileBoostListModel {
  const _$MatchedProfileBoostListModelImpl(
      {final List<MatchedProfileBoostModel>? data})
      : _data = data;

  factory _$MatchedProfileBoostListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MatchedProfileBoostListModelImplFromJson(json);

  final List<MatchedProfileBoostModel>? _data;
  @override
  List<MatchedProfileBoostModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MatchedProfileBoostListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedProfileBoostListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedProfileBoostListModelImplCopyWith<
          _$MatchedProfileBoostListModelImpl>
      get copyWith => __$$MatchedProfileBoostListModelImplCopyWithImpl<
          _$MatchedProfileBoostListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchedProfileBoostListModelImplToJson(
      this,
    );
  }
}

abstract class _MatchedProfileBoostListModel
    implements MatchedProfileBoostListModel {
  const factory _MatchedProfileBoostListModel(
          {final List<MatchedProfileBoostModel>? data}) =
      _$MatchedProfileBoostListModelImpl;

  factory _MatchedProfileBoostListModel.fromJson(Map<String, dynamic> json) =
      _$MatchedProfileBoostListModelImpl.fromJson;

  @override
  List<MatchedProfileBoostModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$MatchedProfileBoostListModelImplCopyWith<
          _$MatchedProfileBoostListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
