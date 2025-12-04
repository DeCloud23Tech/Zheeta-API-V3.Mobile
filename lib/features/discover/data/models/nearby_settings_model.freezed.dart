// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbySettingsModel {
  int get id;
  int get radiusInKm;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbySettingsModelCopyWith<NearbySettingsModel> get copyWith =>
      _$NearbySettingsModelCopyWithImpl<NearbySettingsModel>(
          this as NearbySettingsModel, _$identity);

  /// Serializes this NearbySettingsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbySettingsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radiusInKm, radiusInKm) ||
                other.radiusInKm == radiusInKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, radiusInKm);

  @override
  String toString() {
    return 'NearbySettingsModel(id: $id, radiusInKm: $radiusInKm)';
  }
}

/// @nodoc
abstract mixin class $NearbySettingsModelCopyWith<$Res> {
  factory $NearbySettingsModelCopyWith(
          NearbySettingsModel value, $Res Function(NearbySettingsModel) _then) =
      _$NearbySettingsModelCopyWithImpl;
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class _$NearbySettingsModelCopyWithImpl<$Res>
    implements $NearbySettingsModelCopyWith<$Res> {
  _$NearbySettingsModelCopyWithImpl(this._self, this._then);

  final NearbySettingsModel _self;
  final $Res Function(NearbySettingsModel) _then;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? radiusInKm = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      radiusInKm: null == radiusInKm
          ? _self.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NearbySettingsModel implements NearbySettingsModel {
  _NearbySettingsModel({required this.id, required this.radiusInKm});
  factory _NearbySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$NearbySettingsModelFromJson(json);

  @override
  final int id;
  @override
  final int radiusInKm;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbySettingsModelCopyWith<_NearbySettingsModel> get copyWith =>
      __$NearbySettingsModelCopyWithImpl<_NearbySettingsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbySettingsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbySettingsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radiusInKm, radiusInKm) ||
                other.radiusInKm == radiusInKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, radiusInKm);

  @override
  String toString() {
    return 'NearbySettingsModel(id: $id, radiusInKm: $radiusInKm)';
  }
}

/// @nodoc
abstract mixin class _$NearbySettingsModelCopyWith<$Res>
    implements $NearbySettingsModelCopyWith<$Res> {
  factory _$NearbySettingsModelCopyWith(_NearbySettingsModel value,
          $Res Function(_NearbySettingsModel) _then) =
      __$NearbySettingsModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class __$NearbySettingsModelCopyWithImpl<$Res>
    implements _$NearbySettingsModelCopyWith<$Res> {
  __$NearbySettingsModelCopyWithImpl(this._self, this._then);

  final _NearbySettingsModel _self;
  final $Res Function(_NearbySettingsModel) _then;

  /// Create a copy of NearbySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? radiusInKm = null,
  }) {
    return _then(_NearbySettingsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      radiusInKm: null == radiusInKm
          ? _self.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
