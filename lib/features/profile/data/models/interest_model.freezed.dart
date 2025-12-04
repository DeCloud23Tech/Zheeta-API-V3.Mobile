// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterestModel {
  dynamic get id;
  dynamic get title;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterestModelCopyWith<InterestModel> get copyWith =>
      _$InterestModelCopyWithImpl<InterestModel>(
          this as InterestModel, _$identity);

  /// Serializes this InterestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterestModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class $InterestModelCopyWith<$Res> {
  factory $InterestModelCopyWith(
          InterestModel value, $Res Function(InterestModel) _then) =
      _$InterestModelCopyWithImpl;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$InterestModelCopyWithImpl<$Res>
    implements $InterestModelCopyWith<$Res> {
  _$InterestModelCopyWithImpl(this._self, this._then);

  final InterestModel _self;
  final $Res Function(InterestModel) _then;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InterestModel implements InterestModel {
  _InterestModel({this.id, this.title});
  factory _InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterestModelCopyWith<_InterestModel> get copyWith =>
      __$InterestModelCopyWithImpl<_InterestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterestModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$InterestModelCopyWith<$Res>
    implements $InterestModelCopyWith<$Res> {
  factory _$InterestModelCopyWith(
          _InterestModel value, $Res Function(_InterestModel) _then) =
      __$InterestModelCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$InterestModelCopyWithImpl<$Res>
    implements _$InterestModelCopyWith<$Res> {
  __$InterestModelCopyWithImpl(this._self, this._then);

  final _InterestModel _self;
  final $Res Function(_InterestModel) _then;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_InterestModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$InterestListModel {
  List<InterestModel>? get data;

  /// Create a copy of InterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterestListModelCopyWith<InterestListModel> get copyWith =>
      _$InterestListModelCopyWithImpl<InterestListModel>(
          this as InterestListModel, _$identity);

  /// Serializes this InterestListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterestListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'InterestListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $InterestListModelCopyWith<$Res> {
  factory $InterestListModelCopyWith(
          InterestListModel value, $Res Function(InterestListModel) _then) =
      _$InterestListModelCopyWithImpl;
  @useResult
  $Res call({List<InterestModel>? data});
}

/// @nodoc
class _$InterestListModelCopyWithImpl<$Res>
    implements $InterestListModelCopyWith<$Res> {
  _$InterestListModelCopyWithImpl(this._self, this._then);

  final InterestListModel _self;
  final $Res Function(InterestListModel) _then;

  /// Create a copy of InterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InterestListModel implements InterestListModel {
  _InterestListModel({final List<InterestModel>? data}) : _data = data;
  factory _InterestListModel.fromJson(Map<String, dynamic> json) =>
      _$InterestListModelFromJson(json);

  final List<InterestModel>? _data;
  @override
  List<InterestModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of InterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterestListModelCopyWith<_InterestListModel> get copyWith =>
      __$InterestListModelCopyWithImpl<_InterestListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterestListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterestListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'InterestListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$InterestListModelCopyWith<$Res>
    implements $InterestListModelCopyWith<$Res> {
  factory _$InterestListModelCopyWith(
          _InterestListModel value, $Res Function(_InterestListModel) _then) =
      __$InterestListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<InterestModel>? data});
}

/// @nodoc
class __$InterestListModelCopyWithImpl<$Res>
    implements _$InterestListModelCopyWith<$Res> {
  __$InterestListModelCopyWithImpl(this._self, this._then);

  final _InterestListModel _self;
  final $Res Function(_InterestListModel) _then;

  /// Create a copy of InterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_InterestListModel(
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
    ));
  }
}

// dart format on
