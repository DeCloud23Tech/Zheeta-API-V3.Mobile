// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbySettingsModel _$NearbySettingsModelFromJson(Map<String, dynamic> json) {
  return _NearbySettingsModel.fromJson(json);
}

/// @nodoc
mixin _$NearbySettingsModel {
  int get id => throw _privateConstructorUsedError;
  int get radiusInKm => throw _privateConstructorUsedError;

  /// Serializes this NearbySettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbySettingsModelCopyWith<NearbySettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbySettingsModelCopyWith<$Res> {
  factory $NearbySettingsModelCopyWith(
          NearbySettingsModel value, $Res Function(NearbySettingsModel) then) =
      _$NearbySettingsModelCopyWithImpl<$Res, NearbySettingsModel>;
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class _$NearbySettingsModelCopyWithImpl<$Res, $Val extends NearbySettingsModel>
    implements $NearbySettingsModelCopyWith<$Res> {
  _$NearbySettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? radiusInKm = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      radiusInKm: null == radiusInKm
          ? _value.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbySettingsModelImplCopyWith<$Res>
    implements $NearbySettingsModelCopyWith<$Res> {
  factory _$$NearbySettingsModelImplCopyWith(_$NearbySettingsModelImpl value,
          $Res Function(_$NearbySettingsModelImpl) then) =
      __$$NearbySettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class __$$NearbySettingsModelImplCopyWithImpl<$Res>
    extends _$NearbySettingsModelCopyWithImpl<$Res, _$NearbySettingsModelImpl>
    implements _$$NearbySettingsModelImplCopyWith<$Res> {
  __$$NearbySettingsModelImplCopyWithImpl(_$NearbySettingsModelImpl _value,
      $Res Function(_$NearbySettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? radiusInKm = null,
  }) {
    return _then(_$NearbySettingsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      radiusInKm: null == radiusInKm
          ? _value.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbySettingsModelImpl implements _NearbySettingsModel {
  _$NearbySettingsModelImpl({required this.id, required this.radiusInKm});

  factory _$NearbySettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbySettingsModelImplFromJson(json);

  @override
  final int id;
  @override
  final int radiusInKm;

  @override
  String toString() {
    return 'NearbySettingsModel(id: $id, radiusInKm: $radiusInKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbySettingsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radiusInKm, radiusInKm) ||
                other.radiusInKm == radiusInKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, radiusInKm);

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbySettingsModelImplCopyWith<_$NearbySettingsModelImpl> get copyWith =>
      __$$NearbySettingsModelImplCopyWithImpl<_$NearbySettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbySettingsModelImplToJson(
      this,
    );
  }
}

abstract class _NearbySettingsModel implements NearbySettingsModel {
  factory _NearbySettingsModel(
      {required final int id,
      required final int radiusInKm}) = _$NearbySettingsModelImpl;

  factory _NearbySettingsModel.fromJson(Map<String, dynamic> json) =
      _$NearbySettingsModelImpl.fromJson;

  @override
  int get id;
  @override
  int get radiusInKm;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbySettingsModelImplCopyWith<_$NearbySettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
