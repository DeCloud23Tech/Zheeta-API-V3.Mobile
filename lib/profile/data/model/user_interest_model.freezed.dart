// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInterestModel _$UserInterestModelFromJson(Map<String, dynamic> json) {
  return _UserInterestModel.fromJson(json);
}

/// @nodoc
mixin _$UserInterestModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInterestModelCopyWith<UserInterestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInterestModelCopyWith<$Res> {
  factory $UserInterestModelCopyWith(
          UserInterestModel value, $Res Function(UserInterestModel) then) =
      _$UserInterestModelCopyWithImpl<$Res, UserInterestModel>;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$UserInterestModelCopyWithImpl<$Res, $Val extends UserInterestModel>
    implements $UserInterestModelCopyWith<$Res> {
  _$UserInterestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInterestModelImplCopyWith<$Res>
    implements $UserInterestModelCopyWith<$Res> {
  factory _$$UserInterestModelImplCopyWith(_$UserInterestModelImpl value,
          $Res Function(_$UserInterestModelImpl) then) =
      __$$UserInterestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$$UserInterestModelImplCopyWithImpl<$Res>
    extends _$UserInterestModelCopyWithImpl<$Res, _$UserInterestModelImpl>
    implements _$$UserInterestModelImplCopyWith<$Res> {
  __$$UserInterestModelImplCopyWithImpl(_$UserInterestModelImpl _value,
      $Res Function(_$UserInterestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$UserInterestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$UserInterestModelImpl implements _UserInterestModel {
  const _$UserInterestModelImpl({required this.id, required this.title});

  factory _$UserInterestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInterestModelImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  @override
  String toString() {
    return 'UserInterestModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInterestModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInterestModelImplCopyWith<_$UserInterestModelImpl> get copyWith =>
      __$$UserInterestModelImplCopyWithImpl<_$UserInterestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInterestModelImplToJson(
      this,
    );
  }
}

abstract class _UserInterestModel implements UserInterestModel {
  const factory _UserInterestModel(
      {required final dynamic id,
      required final dynamic title}) = _$UserInterestModelImpl;

  factory _UserInterestModel.fromJson(Map<String, dynamic> json) =
      _$UserInterestModelImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get title;
  @override
  @JsonKey(ignore: true)
  _$$UserInterestModelImplCopyWith<_$UserInterestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInterestListModel _$UserInterestListModelFromJson(
    Map<String, dynamic> json) {
  return _UserInterestListModel.fromJson(json);
}

/// @nodoc
mixin _$UserInterestListModel {
  List<UserInterestModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInterestListModelCopyWith<UserInterestListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInterestListModelCopyWith<$Res> {
  factory $UserInterestListModelCopyWith(UserInterestListModel value,
          $Res Function(UserInterestListModel) then) =
      _$UserInterestListModelCopyWithImpl<$Res, UserInterestListModel>;
  @useResult
  $Res call({List<UserInterestModel> data});
}

/// @nodoc
class _$UserInterestListModelCopyWithImpl<$Res,
        $Val extends UserInterestListModel>
    implements $UserInterestListModelCopyWith<$Res> {
  _$UserInterestListModelCopyWithImpl(this._value, this._then);

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
              as List<UserInterestModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInterestListModelImplCopyWith<$Res>
    implements $UserInterestListModelCopyWith<$Res> {
  factory _$$UserInterestListModelImplCopyWith(
          _$UserInterestListModelImpl value,
          $Res Function(_$UserInterestListModelImpl) then) =
      __$$UserInterestListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserInterestModel> data});
}

/// @nodoc
class __$$UserInterestListModelImplCopyWithImpl<$Res>
    extends _$UserInterestListModelCopyWithImpl<$Res,
        _$UserInterestListModelImpl>
    implements _$$UserInterestListModelImplCopyWith<$Res> {
  __$$UserInterestListModelImplCopyWithImpl(_$UserInterestListModelImpl _value,
      $Res Function(_$UserInterestListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserInterestListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserInterestModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserInterestListModelImpl implements _UserInterestListModel {
  const _$UserInterestListModelImpl(
      {required final List<UserInterestModel> data})
      : _data = data;

  factory _$UserInterestListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInterestListModelImplFromJson(json);

  final List<UserInterestModel> _data;
  @override
  List<UserInterestModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'UserInterestListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInterestListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInterestListModelImplCopyWith<_$UserInterestListModelImpl>
      get copyWith => __$$UserInterestListModelImplCopyWithImpl<
          _$UserInterestListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInterestListModelImplToJson(
      this,
    );
  }
}

abstract class _UserInterestListModel implements UserInterestListModel {
  const factory _UserInterestListModel(
          {required final List<UserInterestModel> data}) =
      _$UserInterestListModelImpl;

  factory _UserInterestListModel.fromJson(Map<String, dynamic> json) =
      _$UserInterestListModelImpl.fromJson;

  @override
  List<UserInterestModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$UserInterestListModelImplCopyWith<_$UserInterestListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
