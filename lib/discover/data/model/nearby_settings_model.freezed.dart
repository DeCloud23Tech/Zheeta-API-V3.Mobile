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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NearbySettingsModel _$NearbySettingsModelFromJson(Map<String, dynamic> json) {
  return _NearbySettingsModel.fromJson(json);
}

/// @nodoc
mixin _$NearbySettingsModel {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  NearbySettingsDataModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbySettingsModelCopyWith<NearbySettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbySettingsModelCopyWith<$Res> {
  factory $NearbySettingsModelCopyWith(
          NearbySettingsModel value, $Res Function(NearbySettingsModel) then) =
      _$NearbySettingsModelCopyWithImpl<$Res, NearbySettingsModel>;
  @useResult
  $Res call(
      {int statusCode,
      String message,
      bool success,
      int totalCount,
      NearbySettingsDataModel data});

  $NearbySettingsDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$NearbySettingsModelCopyWithImpl<$Res, $Val extends NearbySettingsModel>
    implements $NearbySettingsModelCopyWith<$Res> {
  _$NearbySettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NearbySettingsDataModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NearbySettingsDataModelCopyWith<$Res> get data {
    return $NearbySettingsDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
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
  $Res call(
      {int statusCode,
      String message,
      bool success,
      int totalCount,
      NearbySettingsDataModel data});

  @override
  $NearbySettingsDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$NearbySettingsModelImplCopyWithImpl<$Res>
    extends _$NearbySettingsModelCopyWithImpl<$Res, _$NearbySettingsModelImpl>
    implements _$$NearbySettingsModelImplCopyWith<$Res> {
  __$$NearbySettingsModelImplCopyWithImpl(_$NearbySettingsModelImpl _value,
      $Res Function(_$NearbySettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_$NearbySettingsModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NearbySettingsDataModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbySettingsModelImpl implements _NearbySettingsModel {
  _$NearbySettingsModelImpl(
      {required this.statusCode,
      required this.message,
      required this.success,
      required this.totalCount,
      required this.data});

  factory _$NearbySettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbySettingsModelImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;
  @override
  final int totalCount;
  @override
  final NearbySettingsDataModel data;

  @override
  String toString() {
    return 'NearbySettingsModel(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbySettingsModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, message, success, totalCount, data);

  @JsonKey(ignore: true)
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
      {required final int statusCode,
      required final String message,
      required final bool success,
      required final int totalCount,
      required final NearbySettingsDataModel data}) = _$NearbySettingsModelImpl;

  factory _NearbySettingsModel.fromJson(Map<String, dynamic> json) =
      _$NearbySettingsModelImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  int get totalCount;
  @override
  NearbySettingsDataModel get data;
  @override
  @JsonKey(ignore: true)
  _$$NearbySettingsModelImplCopyWith<_$NearbySettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearbySettingsDataModel _$NearbySettingsDataModelFromJson(
    Map<String, dynamic> json) {
  return _NearbySettingsDataModel.fromJson(json);
}

/// @nodoc
mixin _$NearbySettingsDataModel {
  int get id => throw _privateConstructorUsedError;
  int get radiusInKm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbySettingsDataModelCopyWith<NearbySettingsDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbySettingsDataModelCopyWith<$Res> {
  factory $NearbySettingsDataModelCopyWith(NearbySettingsDataModel value,
          $Res Function(NearbySettingsDataModel) then) =
      _$NearbySettingsDataModelCopyWithImpl<$Res, NearbySettingsDataModel>;
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class _$NearbySettingsDataModelCopyWithImpl<$Res,
        $Val extends NearbySettingsDataModel>
    implements $NearbySettingsDataModelCopyWith<$Res> {
  _$NearbySettingsDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$NearbySettingsDataModelImplCopyWith<$Res>
    implements $NearbySettingsDataModelCopyWith<$Res> {
  factory _$$NearbySettingsDataModelImplCopyWith(
          _$NearbySettingsDataModelImpl value,
          $Res Function(_$NearbySettingsDataModelImpl) then) =
      __$$NearbySettingsDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int radiusInKm});
}

/// @nodoc
class __$$NearbySettingsDataModelImplCopyWithImpl<$Res>
    extends _$NearbySettingsDataModelCopyWithImpl<$Res,
        _$NearbySettingsDataModelImpl>
    implements _$$NearbySettingsDataModelImplCopyWith<$Res> {
  __$$NearbySettingsDataModelImplCopyWithImpl(
      _$NearbySettingsDataModelImpl _value,
      $Res Function(_$NearbySettingsDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? radiusInKm = null,
  }) {
    return _then(_$NearbySettingsDataModelImpl(
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
class _$NearbySettingsDataModelImpl implements _NearbySettingsDataModel {
  _$NearbySettingsDataModelImpl({required this.id, required this.radiusInKm});

  factory _$NearbySettingsDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbySettingsDataModelImplFromJson(json);

  @override
  final int id;
  @override
  final int radiusInKm;

  @override
  String toString() {
    return 'NearbySettingsDataModel(id: $id, radiusInKm: $radiusInKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbySettingsDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radiusInKm, radiusInKm) ||
                other.radiusInKm == radiusInKm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, radiusInKm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbySettingsDataModelImplCopyWith<_$NearbySettingsDataModelImpl>
      get copyWith => __$$NearbySettingsDataModelImplCopyWithImpl<
          _$NearbySettingsDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbySettingsDataModelImplToJson(
      this,
    );
  }
}

abstract class _NearbySettingsDataModel implements NearbySettingsDataModel {
  factory _NearbySettingsDataModel(
      {required final int id,
      required final int radiusInKm}) = _$NearbySettingsDataModelImpl;

  factory _NearbySettingsDataModel.fromJson(Map<String, dynamic> json) =
      _$NearbySettingsDataModelImpl.fromJson;

  @override
  int get id;
  @override
  int get radiusInKm;
  @override
  @JsonKey(ignore: true)
  _$$NearbySettingsDataModelImplCopyWith<_$NearbySettingsDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
