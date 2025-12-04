// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInterestModel {
  dynamic get id;
  dynamic get title;

  /// Create a copy of UserInterestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInterestModelCopyWith<UserInterestModel> get copyWith =>
      _$UserInterestModelCopyWithImpl<UserInterestModel>(
          this as UserInterestModel, _$identity);

  /// Serializes this UserInterestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInterestModel &&
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
    return 'UserInterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class $UserInterestModelCopyWith<$Res> {
  factory $UserInterestModelCopyWith(
          UserInterestModel value, $Res Function(UserInterestModel) _then) =
      _$UserInterestModelCopyWithImpl;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$UserInterestModelCopyWithImpl<$Res>
    implements $UserInterestModelCopyWith<$Res> {
  _$UserInterestModelCopyWithImpl(this._self, this._then);

  final UserInterestModel _self;
  final $Res Function(UserInterestModel) _then;

  /// Create a copy of UserInterestModel
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
class _UserInterestModel implements UserInterestModel {
  _UserInterestModel({required this.id, required this.title});
  factory _UserInterestModel.fromJson(Map<String, dynamic> json) =>
      _$UserInterestModelFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  /// Create a copy of UserInterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInterestModelCopyWith<_UserInterestModel> get copyWith =>
      __$UserInterestModelCopyWithImpl<_UserInterestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInterestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInterestModel &&
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
    return 'UserInterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$UserInterestModelCopyWith<$Res>
    implements $UserInterestModelCopyWith<$Res> {
  factory _$UserInterestModelCopyWith(
          _UserInterestModel value, $Res Function(_UserInterestModel) _then) =
      __$UserInterestModelCopyWithImpl;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$UserInterestModelCopyWithImpl<$Res>
    implements _$UserInterestModelCopyWith<$Res> {
  __$UserInterestModelCopyWithImpl(this._self, this._then);

  final _UserInterestModel _self;
  final $Res Function(_UserInterestModel) _then;

  /// Create a copy of UserInterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_UserInterestModel(
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
mixin _$UserInterestListModel {
  List<UserInterestModel> get data;

  /// Create a copy of UserInterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInterestListModelCopyWith<UserInterestListModel> get copyWith =>
      _$UserInterestListModelCopyWithImpl<UserInterestListModel>(
          this as UserInterestListModel, _$identity);

  /// Serializes this UserInterestListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInterestListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'UserInterestListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UserInterestListModelCopyWith<$Res> {
  factory $UserInterestListModelCopyWith(UserInterestListModel value,
          $Res Function(UserInterestListModel) _then) =
      _$UserInterestListModelCopyWithImpl;
  @useResult
  $Res call({List<UserInterestModel> data});
}

/// @nodoc
class _$UserInterestListModelCopyWithImpl<$Res>
    implements $UserInterestListModelCopyWith<$Res> {
  _$UserInterestListModelCopyWithImpl(this._self, this._then);

  final UserInterestListModel _self;
  final $Res Function(UserInterestListModel) _then;

  /// Create a copy of UserInterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserInterestModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserInterestListModel implements UserInterestListModel {
  _UserInterestListModel({required final List<UserInterestModel> data})
      : _data = data;
  factory _UserInterestListModel.fromJson(Map<String, dynamic> json) =>
      _$UserInterestListModelFromJson(json);

  final List<UserInterestModel> _data;
  @override
  List<UserInterestModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of UserInterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInterestListModelCopyWith<_UserInterestListModel> get copyWith =>
      __$UserInterestListModelCopyWithImpl<_UserInterestListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInterestListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInterestListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'UserInterestListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$UserInterestListModelCopyWith<$Res>
    implements $UserInterestListModelCopyWith<$Res> {
  factory _$UserInterestListModelCopyWith(_UserInterestListModel value,
          $Res Function(_UserInterestListModel) _then) =
      __$UserInterestListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<UserInterestModel> data});
}

/// @nodoc
class __$UserInterestListModelCopyWithImpl<$Res>
    implements _$UserInterestListModelCopyWith<$Res> {
  __$UserInterestListModelCopyWithImpl(this._self, this._then);

  final _UserInterestListModel _self;
  final $Res Function(_UserInterestListModel) _then;

  /// Create a copy of UserInterestListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_UserInterestListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserInterestModel>,
    ));
  }
}

// dart format on
