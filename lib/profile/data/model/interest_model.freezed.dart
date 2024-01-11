// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InterestModel _$InterestModelFromJson(Map<String, dynamic> json) {
  return _InterestModel.fromJson(json);
}

/// @nodoc
mixin _$InterestModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterestModelCopyWith<InterestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestModelCopyWith<$Res> {
  factory $InterestModelCopyWith(
          InterestModel value, $Res Function(InterestModel) then) =
      _$InterestModelCopyWithImpl<$Res, InterestModel>;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$InterestModelCopyWithImpl<$Res, $Val extends InterestModel>
    implements $InterestModelCopyWith<$Res> {
  _$InterestModelCopyWithImpl(this._value, this._then);

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
abstract class _$$InterestModelImplCopyWith<$Res>
    implements $InterestModelCopyWith<$Res> {
  factory _$$InterestModelImplCopyWith(
          _$InterestModelImpl value, $Res Function(_$InterestModelImpl) then) =
      __$$InterestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$$InterestModelImplCopyWithImpl<$Res>
    extends _$InterestModelCopyWithImpl<$Res, _$InterestModelImpl>
    implements _$$InterestModelImplCopyWith<$Res> {
  __$$InterestModelImplCopyWithImpl(
      _$InterestModelImpl _value, $Res Function(_$InterestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$InterestModelImpl(
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
class _$InterestModelImpl implements _InterestModel {
  const _$InterestModelImpl({this.id, this.title});

  factory _$InterestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestModelImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestModelImpl &&
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
  _$$InterestModelImplCopyWith<_$InterestModelImpl> get copyWith =>
      __$$InterestModelImplCopyWithImpl<_$InterestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestModelImplToJson(
      this,
    );
  }
}

abstract class _InterestModel implements InterestModel {
  const factory _InterestModel({final dynamic id, final dynamic title}) =
      _$InterestModelImpl;

  factory _InterestModel.fromJson(Map<String, dynamic> json) =
      _$InterestModelImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get title;
  @override
  @JsonKey(ignore: true)
  _$$InterestModelImplCopyWith<_$InterestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterestListModel _$InterestListModelFromJson(Map<String, dynamic> json) {
  return _InterestListModel.fromJson(json);
}

/// @nodoc
mixin _$InterestListModel {
  List<InterestModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterestListModelCopyWith<InterestListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestListModelCopyWith<$Res> {
  factory $InterestListModelCopyWith(
          InterestListModel value, $Res Function(InterestListModel) then) =
      _$InterestListModelCopyWithImpl<$Res, InterestListModel>;
  @useResult
  $Res call({List<InterestModel>? data});
}

/// @nodoc
class _$InterestListModelCopyWithImpl<$Res, $Val extends InterestListModel>
    implements $InterestListModelCopyWith<$Res> {
  _$InterestListModelCopyWithImpl(this._value, this._then);

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
              as List<InterestModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterestListModelImplCopyWith<$Res>
    implements $InterestListModelCopyWith<$Res> {
  factory _$$InterestListModelImplCopyWith(_$InterestListModelImpl value,
          $Res Function(_$InterestListModelImpl) then) =
      __$$InterestListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<InterestModel>? data});
}

/// @nodoc
class __$$InterestListModelImplCopyWithImpl<$Res>
    extends _$InterestListModelCopyWithImpl<$Res, _$InterestListModelImpl>
    implements _$$InterestListModelImplCopyWith<$Res> {
  __$$InterestListModelImplCopyWithImpl(_$InterestListModelImpl _value,
      $Res Function(_$InterestListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$InterestListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InterestListModelImpl implements _InterestListModel {
  const _$InterestListModelImpl({final List<InterestModel>? data})
      : _data = data;

  factory _$InterestListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestListModelImplFromJson(json);

  final List<InterestModel>? _data;
  @override
  List<InterestModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InterestListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestListModelImplCopyWith<_$InterestListModelImpl> get copyWith =>
      __$$InterestListModelImplCopyWithImpl<_$InterestListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestListModelImplToJson(
      this,
    );
  }
}

abstract class _InterestListModel implements InterestListModel {
  const factory _InterestListModel({final List<InterestModel>? data}) =
      _$InterestListModelImpl;

  factory _InterestListModel.fromJson(Map<String, dynamic> json) =
      _$InterestListModelImpl.fromJson;

  @override
  List<InterestModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$InterestListModelImplCopyWith<_$InterestListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
