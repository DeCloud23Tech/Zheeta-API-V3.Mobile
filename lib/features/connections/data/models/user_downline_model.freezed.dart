// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_downline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDownlineModel {
  String get id;
  String get firstName;
  String get lastName;
  String get userName;
  String get profilePhotoURL;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDownlineModelCopyWith<UserDownlineModel> get copyWith =>
      _$UserDownlineModelCopyWithImpl<UserDownlineModel>(
          this as UserDownlineModel, _$identity);

  /// Serializes this UserDownlineModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDownlineModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, userName, profilePhotoURL);

  @override
  String toString() {
    return 'UserDownlineModel(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, profilePhotoURL: $profilePhotoURL)';
  }
}

/// @nodoc
abstract mixin class $UserDownlineModelCopyWith<$Res> {
  factory $UserDownlineModelCopyWith(
          UserDownlineModel value, $Res Function(UserDownlineModel) _then) =
      _$UserDownlineModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String userName,
      String profilePhotoURL});
}

/// @nodoc
class _$UserDownlineModelCopyWithImpl<$Res>
    implements $UserDownlineModelCopyWith<$Res> {
  _$UserDownlineModelCopyWithImpl(this._self, this._then);

  final UserDownlineModel _self;
  final $Res Function(UserDownlineModel) _then;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? profilePhotoURL = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDownlineModel implements UserDownlineModel {
  const _UserDownlineModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.profilePhotoURL});
  factory _UserDownlineModel.fromJson(Map<String, dynamic> json) =>
      _$UserDownlineModelFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String userName;
  @override
  final String profilePhotoURL;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDownlineModelCopyWith<_UserDownlineModel> get copyWith =>
      __$UserDownlineModelCopyWithImpl<_UserDownlineModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDownlineModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDownlineModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, userName, profilePhotoURL);

  @override
  String toString() {
    return 'UserDownlineModel(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, profilePhotoURL: $profilePhotoURL)';
  }
}

/// @nodoc
abstract mixin class _$UserDownlineModelCopyWith<$Res>
    implements $UserDownlineModelCopyWith<$Res> {
  factory _$UserDownlineModelCopyWith(
          _UserDownlineModel value, $Res Function(_UserDownlineModel) _then) =
      __$UserDownlineModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String userName,
      String profilePhotoURL});
}

/// @nodoc
class __$UserDownlineModelCopyWithImpl<$Res>
    implements _$UserDownlineModelCopyWith<$Res> {
  __$UserDownlineModelCopyWithImpl(this._self, this._then);

  final _UserDownlineModel _self;
  final $Res Function(_UserDownlineModel) _then;

  /// Create a copy of UserDownlineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userName = null,
    Object? profilePhotoURL = null,
  }) {
    return _then(_UserDownlineModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserDownlineListModel {
  List<UserDownlineModel> get data;

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDownlineListModelCopyWith<UserDownlineListModel> get copyWith =>
      _$UserDownlineListModelCopyWithImpl<UserDownlineListModel>(
          this as UserDownlineListModel, _$identity);

  /// Serializes this UserDownlineListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDownlineListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'UserDownlineListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UserDownlineListModelCopyWith<$Res> {
  factory $UserDownlineListModelCopyWith(UserDownlineListModel value,
          $Res Function(UserDownlineListModel) _then) =
      _$UserDownlineListModelCopyWithImpl;
  @useResult
  $Res call({List<UserDownlineModel> data});
}

/// @nodoc
class _$UserDownlineListModelCopyWithImpl<$Res>
    implements $UserDownlineListModelCopyWith<$Res> {
  _$UserDownlineListModelCopyWithImpl(this._self, this._then);

  final UserDownlineListModel _self;
  final $Res Function(UserDownlineListModel) _then;

  /// Create a copy of UserDownlineListModel
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
              as List<UserDownlineModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDownlineListModel implements UserDownlineListModel {
  const _UserDownlineListModel({required final List<UserDownlineModel> data})
      : _data = data;
  factory _UserDownlineListModel.fromJson(Map<String, dynamic> json) =>
      _$UserDownlineListModelFromJson(json);

  final List<UserDownlineModel> _data;
  @override
  List<UserDownlineModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDownlineListModelCopyWith<_UserDownlineListModel> get copyWith =>
      __$UserDownlineListModelCopyWithImpl<_UserDownlineListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDownlineListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDownlineListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'UserDownlineListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$UserDownlineListModelCopyWith<$Res>
    implements $UserDownlineListModelCopyWith<$Res> {
  factory _$UserDownlineListModelCopyWith(_UserDownlineListModel value,
          $Res Function(_UserDownlineListModel) _then) =
      __$UserDownlineListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<UserDownlineModel> data});
}

/// @nodoc
class __$UserDownlineListModelCopyWithImpl<$Res>
    implements _$UserDownlineListModelCopyWith<$Res> {
  __$UserDownlineListModelCopyWithImpl(this._self, this._then);

  final _UserDownlineListModel _self;
  final $Res Function(_UserDownlineListModel) _then;

  /// Create a copy of UserDownlineListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_UserDownlineListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDownlineModel>,
    ));
  }
}

// dart format on
