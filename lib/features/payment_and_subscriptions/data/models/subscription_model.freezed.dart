// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionModel {
  int get id;
  String get name;
  String? get description;
  double get fee;
  bool get allowMessaging;
  bool get allowWithdrawal;
  bool get accessPeopleNearby;
  int get noMatchesPerDay;
  int get noOfBuddyEventPerWeek;
  int get noNearbyPerWeek;
  int get noOfChatMessagePerWeek;
  List<String> get features;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      _$SubscriptionModelCopyWithImpl<SubscriptionModel>(
          this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.allowMessaging, allowMessaging) ||
                other.allowMessaging == allowMessaging) &&
            (identical(other.allowWithdrawal, allowWithdrawal) ||
                other.allowWithdrawal == allowWithdrawal) &&
            (identical(other.accessPeopleNearby, accessPeopleNearby) ||
                other.accessPeopleNearby == accessPeopleNearby) &&
            (identical(other.noMatchesPerDay, noMatchesPerDay) ||
                other.noMatchesPerDay == noMatchesPerDay) &&
            (identical(other.noOfBuddyEventPerWeek, noOfBuddyEventPerWeek) ||
                other.noOfBuddyEventPerWeek == noOfBuddyEventPerWeek) &&
            (identical(other.noNearbyPerWeek, noNearbyPerWeek) ||
                other.noNearbyPerWeek == noNearbyPerWeek) &&
            (identical(other.noOfChatMessagePerWeek, noOfChatMessagePerWeek) ||
                other.noOfChatMessagePerWeek == noOfChatMessagePerWeek) &&
            const DeepCollectionEquality().equals(other.features, features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      fee,
      allowMessaging,
      allowWithdrawal,
      accessPeopleNearby,
      noMatchesPerDay,
      noOfBuddyEventPerWeek,
      noNearbyPerWeek,
      noOfChatMessagePerWeek,
      const DeepCollectionEquality().hash(features));

  @override
  String toString() {
    return 'SubscriptionModel(id: $id, name: $name, description: $description, fee: $fee, allowMessaging: $allowMessaging, allowWithdrawal: $allowWithdrawal, accessPeopleNearby: $accessPeopleNearby, noMatchesPerDay: $noMatchesPerDay, noOfBuddyEventPerWeek: $noOfBuddyEventPerWeek, noNearbyPerWeek: $noNearbyPerWeek, noOfChatMessagePerWeek: $noOfChatMessagePerWeek, features: $features)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) _then) =
      _$SubscriptionModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      double fee,
      bool allowMessaging,
      bool allowWithdrawal,
      bool accessPeopleNearby,
      int noMatchesPerDay,
      int noOfBuddyEventPerWeek,
      int noNearbyPerWeek,
      int noOfChatMessagePerWeek,
      List<String> features});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? fee = null,
    Object? allowMessaging = null,
    Object? allowWithdrawal = null,
    Object? accessPeopleNearby = null,
    Object? noMatchesPerDay = null,
    Object? noOfBuddyEventPerWeek = null,
    Object? noNearbyPerWeek = null,
    Object? noOfChatMessagePerWeek = null,
    Object? features = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      allowMessaging: null == allowMessaging
          ? _self.allowMessaging
          : allowMessaging // ignore: cast_nullable_to_non_nullable
              as bool,
      allowWithdrawal: null == allowWithdrawal
          ? _self.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as bool,
      accessPeopleNearby: null == accessPeopleNearby
          ? _self.accessPeopleNearby
          : accessPeopleNearby // ignore: cast_nullable_to_non_nullable
              as bool,
      noMatchesPerDay: null == noMatchesPerDay
          ? _self.noMatchesPerDay
          : noMatchesPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddyEventPerWeek: null == noOfBuddyEventPerWeek
          ? _self.noOfBuddyEventPerWeek
          : noOfBuddyEventPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      noNearbyPerWeek: null == noNearbyPerWeek
          ? _self.noNearbyPerWeek
          : noNearbyPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      noOfChatMessagePerWeek: null == noOfChatMessagePerWeek
          ? _self.noOfChatMessagePerWeek
          : noOfChatMessagePerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionModel implements SubscriptionModel {
  const _SubscriptionModel(
      {required this.id,
      required this.name,
      this.description,
      required this.fee,
      required this.allowMessaging,
      required this.allowWithdrawal,
      required this.accessPeopleNearby,
      required this.noMatchesPerDay,
      required this.noOfBuddyEventPerWeek,
      required this.noNearbyPerWeek,
      required this.noOfChatMessagePerWeek,
      final List<String> features = const []})
      : _features = features;
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double fee;
  @override
  final bool allowMessaging;
  @override
  final bool allowWithdrawal;
  @override
  final bool accessPeopleNearby;
  @override
  final int noMatchesPerDay;
  @override
  final int noOfBuddyEventPerWeek;
  @override
  final int noNearbyPerWeek;
  @override
  final int noOfChatMessagePerWeek;
  final List<String> _features;
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith =>
      __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.allowMessaging, allowMessaging) ||
                other.allowMessaging == allowMessaging) &&
            (identical(other.allowWithdrawal, allowWithdrawal) ||
                other.allowWithdrawal == allowWithdrawal) &&
            (identical(other.accessPeopleNearby, accessPeopleNearby) ||
                other.accessPeopleNearby == accessPeopleNearby) &&
            (identical(other.noMatchesPerDay, noMatchesPerDay) ||
                other.noMatchesPerDay == noMatchesPerDay) &&
            (identical(other.noOfBuddyEventPerWeek, noOfBuddyEventPerWeek) ||
                other.noOfBuddyEventPerWeek == noOfBuddyEventPerWeek) &&
            (identical(other.noNearbyPerWeek, noNearbyPerWeek) ||
                other.noNearbyPerWeek == noNearbyPerWeek) &&
            (identical(other.noOfChatMessagePerWeek, noOfChatMessagePerWeek) ||
                other.noOfChatMessagePerWeek == noOfChatMessagePerWeek) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      fee,
      allowMessaging,
      allowWithdrawal,
      accessPeopleNearby,
      noMatchesPerDay,
      noOfBuddyEventPerWeek,
      noNearbyPerWeek,
      noOfChatMessagePerWeek,
      const DeepCollectionEquality().hash(_features));

  @override
  String toString() {
    return 'SubscriptionModel(id: $id, name: $name, description: $description, fee: $fee, allowMessaging: $allowMessaging, allowWithdrawal: $allowWithdrawal, accessPeopleNearby: $accessPeopleNearby, noMatchesPerDay: $noMatchesPerDay, noOfBuddyEventPerWeek: $noOfBuddyEventPerWeek, noNearbyPerWeek: $noNearbyPerWeek, noOfChatMessagePerWeek: $noOfChatMessagePerWeek, features: $features)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(
          _SubscriptionModel value, $Res Function(_SubscriptionModel) _then) =
      __$SubscriptionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      double fee,
      bool allowMessaging,
      bool allowWithdrawal,
      bool accessPeopleNearby,
      int noMatchesPerDay,
      int noOfBuddyEventPerWeek,
      int noNearbyPerWeek,
      int noOfChatMessagePerWeek,
      List<String> features});
}

/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? fee = null,
    Object? allowMessaging = null,
    Object? allowWithdrawal = null,
    Object? accessPeopleNearby = null,
    Object? noMatchesPerDay = null,
    Object? noOfBuddyEventPerWeek = null,
    Object? noNearbyPerWeek = null,
    Object? noOfChatMessagePerWeek = null,
    Object? features = null,
  }) {
    return _then(_SubscriptionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: null == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      allowMessaging: null == allowMessaging
          ? _self.allowMessaging
          : allowMessaging // ignore: cast_nullable_to_non_nullable
              as bool,
      allowWithdrawal: null == allowWithdrawal
          ? _self.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as bool,
      accessPeopleNearby: null == accessPeopleNearby
          ? _self.accessPeopleNearby
          : accessPeopleNearby // ignore: cast_nullable_to_non_nullable
              as bool,
      noMatchesPerDay: null == noMatchesPerDay
          ? _self.noMatchesPerDay
          : noMatchesPerDay // ignore: cast_nullable_to_non_nullable
              as int,
      noOfBuddyEventPerWeek: null == noOfBuddyEventPerWeek
          ? _self.noOfBuddyEventPerWeek
          : noOfBuddyEventPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      noNearbyPerWeek: null == noNearbyPerWeek
          ? _self.noNearbyPerWeek
          : noNearbyPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      noOfChatMessagePerWeek: null == noOfChatMessagePerWeek
          ? _self.noOfChatMessagePerWeek
          : noOfChatMessagePerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      features: null == features
          ? _self._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionListModel {
  List<SubscriptionModel> get data;

  /// Create a copy of SubscriptionListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionListModelCopyWith<SubscriptionListModel> get copyWith =>
      _$SubscriptionListModelCopyWithImpl<SubscriptionListModel>(
          this as SubscriptionListModel, _$identity);

  /// Serializes this SubscriptionListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SubscriptionListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionListModelCopyWith<$Res> {
  factory $SubscriptionListModelCopyWith(SubscriptionListModel value,
          $Res Function(SubscriptionListModel) _then) =
      _$SubscriptionListModelCopyWithImpl;
  @useResult
  $Res call({List<SubscriptionModel> data});
}

/// @nodoc
class _$SubscriptionListModelCopyWithImpl<$Res>
    implements $SubscriptionListModelCopyWith<$Res> {
  _$SubscriptionListModelCopyWithImpl(this._self, this._then);

  final SubscriptionListModel _self;
  final $Res Function(SubscriptionListModel) _then;

  /// Create a copy of SubscriptionListModel
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
              as List<SubscriptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionListModel implements SubscriptionListModel {
  _SubscriptionListModel({required final List<SubscriptionModel> data})
      : _data = data;
  factory _SubscriptionListModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListModelFromJson(json);

  final List<SubscriptionModel> _data;
  @override
  List<SubscriptionModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of SubscriptionListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionListModelCopyWith<_SubscriptionListModel> get copyWith =>
      __$SubscriptionListModelCopyWithImpl<_SubscriptionListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'SubscriptionListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionListModelCopyWith<$Res>
    implements $SubscriptionListModelCopyWith<$Res> {
  factory _$SubscriptionListModelCopyWith(_SubscriptionListModel value,
          $Res Function(_SubscriptionListModel) _then) =
      __$SubscriptionListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<SubscriptionModel> data});
}

/// @nodoc
class __$SubscriptionListModelCopyWithImpl<$Res>
    implements _$SubscriptionListModelCopyWith<$Res> {
  __$SubscriptionListModelCopyWithImpl(this._self, this._then);

  final _SubscriptionListModel _self;
  final $Res Function(_SubscriptionListModel) _then;

  /// Create a copy of SubscriptionListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_SubscriptionListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionModel>,
    ));
  }
}

// dart format on
