// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_by_admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserByAdminListModel _$SearchUserByAdminListModelFromJson(
    Map<String, dynamic> json) {
  return _SearchUserByAdminListModel.fromJson(json);
}

/// @nodoc
mixin _$SearchUserByAdminListModel {
  List<AllUserProfileModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserByAdminListModelCopyWith<SearchUserByAdminListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserByAdminListModelCopyWith<$Res> {
  factory $SearchUserByAdminListModelCopyWith(SearchUserByAdminListModel value,
          $Res Function(SearchUserByAdminListModel) then) =
      _$SearchUserByAdminListModelCopyWithImpl<$Res,
          SearchUserByAdminListModel>;
  @useResult
  $Res call({List<AllUserProfileModel>? data});
}

/// @nodoc
class _$SearchUserByAdminListModelCopyWithImpl<$Res,
        $Val extends SearchUserByAdminListModel>
    implements $SearchUserByAdminListModelCopyWith<$Res> {
  _$SearchUserByAdminListModelCopyWithImpl(this._value, this._then);

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
              as List<AllUserProfileModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserByAdminListModelImplCopyWith<$Res>
    implements $SearchUserByAdminListModelCopyWith<$Res> {
  factory _$$SearchUserByAdminListModelImplCopyWith(
          _$SearchUserByAdminListModelImpl value,
          $Res Function(_$SearchUserByAdminListModelImpl) then) =
      __$$SearchUserByAdminListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AllUserProfileModel>? data});
}

/// @nodoc
class __$$SearchUserByAdminListModelImplCopyWithImpl<$Res>
    extends _$SearchUserByAdminListModelCopyWithImpl<$Res,
        _$SearchUserByAdminListModelImpl>
    implements _$$SearchUserByAdminListModelImplCopyWith<$Res> {
  __$$SearchUserByAdminListModelImplCopyWithImpl(
      _$SearchUserByAdminListModelImpl _value,
      $Res Function(_$SearchUserByAdminListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SearchUserByAdminListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AllUserProfileModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SearchUserByAdminListModelImpl implements _SearchUserByAdminListModel {
  _$SearchUserByAdminListModelImpl({final List<AllUserProfileModel>? data})
      : _data = data;

  factory _$SearchUserByAdminListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SearchUserByAdminListModelImplFromJson(json);

  final List<AllUserProfileModel>? _data;
  @override
  List<AllUserProfileModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchUserByAdminListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserByAdminListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserByAdminListModelImplCopyWith<_$SearchUserByAdminListModelImpl>
      get copyWith => __$$SearchUserByAdminListModelImplCopyWithImpl<
          _$SearchUserByAdminListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserByAdminListModelImplToJson(
      this,
    );
  }
}

abstract class _SearchUserByAdminListModel
    implements SearchUserByAdminListModel {
  factory _SearchUserByAdminListModel({final List<AllUserProfileModel>? data}) =
      _$SearchUserByAdminListModelImpl;

  factory _SearchUserByAdminListModel.fromJson(Map<String, dynamic> json) =
      _$SearchUserByAdminListModelImpl.fromJson;

  @override
  List<AllUserProfileModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserByAdminListModelImplCopyWith<_$SearchUserByAdminListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
