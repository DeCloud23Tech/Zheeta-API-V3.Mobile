// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationState {
  State<AddressFromLocationModel> get getAddressFromLocationCoordinateState =>
      throw _privateConstructorUsedError;
  State<dynamic> get getLocationCoordinateFromAddressState =>
      throw _privateConstructorUsedError;
  State<Position> get getCurrentLocationState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call(
      {State<AddressFromLocationModel> getAddressFromLocationCoordinateState,
      State<dynamic> getLocationCoordinateFromAddressState,
      State<Position> getCurrentLocationState});

  $StateCopyWith<AddressFromLocationModel, $Res>
      get getAddressFromLocationCoordinateState;
  $StateCopyWith<dynamic, $Res> get getLocationCoordinateFromAddressState;
  $StateCopyWith<Position, $Res> get getCurrentLocationState;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAddressFromLocationCoordinateState = null,
    Object? getLocationCoordinateFromAddressState = null,
    Object? getCurrentLocationState = null,
  }) {
    return _then(_value.copyWith(
      getAddressFromLocationCoordinateState: null ==
              getAddressFromLocationCoordinateState
          ? _value.getAddressFromLocationCoordinateState
          : getAddressFromLocationCoordinateState // ignore: cast_nullable_to_non_nullable
              as State<AddressFromLocationModel>,
      getLocationCoordinateFromAddressState: null ==
              getLocationCoordinateFromAddressState
          ? _value.getLocationCoordinateFromAddressState
          : getLocationCoordinateFromAddressState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getCurrentLocationState: null == getCurrentLocationState
          ? _value.getCurrentLocationState
          : getCurrentLocationState // ignore: cast_nullable_to_non_nullable
              as State<Position>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<AddressFromLocationModel, $Res>
      get getAddressFromLocationCoordinateState {
    return $StateCopyWith<AddressFromLocationModel, $Res>(
        _value.getAddressFromLocationCoordinateState, (value) {
      return _then(_value.copyWith(getAddressFromLocationCoordinateState: value)
          as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get getLocationCoordinateFromAddressState {
    return $StateCopyWith<dynamic, $Res>(
        _value.getLocationCoordinateFromAddressState, (value) {
      return _then(_value.copyWith(getLocationCoordinateFromAddressState: value)
          as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<Position, $Res> get getCurrentLocationState {
    return $StateCopyWith<Position, $Res>(_value.getCurrentLocationState,
        (value) {
      return _then(_value.copyWith(getCurrentLocationState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
          _$LocationStateImpl value, $Res Function(_$LocationStateImpl) then) =
      __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {State<AddressFromLocationModel> getAddressFromLocationCoordinateState,
      State<dynamic> getLocationCoordinateFromAddressState,
      State<Position> getCurrentLocationState});

  @override
  $StateCopyWith<AddressFromLocationModel, $Res>
      get getAddressFromLocationCoordinateState;
  @override
  $StateCopyWith<dynamic, $Res> get getLocationCoordinateFromAddressState;
  @override
  $StateCopyWith<Position, $Res> get getCurrentLocationState;
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
      _$LocationStateImpl _value, $Res Function(_$LocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAddressFromLocationCoordinateState = null,
    Object? getLocationCoordinateFromAddressState = null,
    Object? getCurrentLocationState = null,
  }) {
    return _then(_$LocationStateImpl(
      getAddressFromLocationCoordinateState: null ==
              getAddressFromLocationCoordinateState
          ? _value.getAddressFromLocationCoordinateState
          : getAddressFromLocationCoordinateState // ignore: cast_nullable_to_non_nullable
              as State<AddressFromLocationModel>,
      getLocationCoordinateFromAddressState: null ==
              getLocationCoordinateFromAddressState
          ? _value.getLocationCoordinateFromAddressState
          : getLocationCoordinateFromAddressState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getCurrentLocationState: null == getCurrentLocationState
          ? _value.getCurrentLocationState
          : getCurrentLocationState // ignore: cast_nullable_to_non_nullable
              as State<Position>,
    ));
  }
}

/// @nodoc

class _$LocationStateImpl extends _LocationState {
  _$LocationStateImpl(
      {required this.getAddressFromLocationCoordinateState,
      required this.getLocationCoordinateFromAddressState,
      required this.getCurrentLocationState})
      : super._();

  @override
  final State<AddressFromLocationModel> getAddressFromLocationCoordinateState;
  @override
  final State<dynamic> getLocationCoordinateFromAddressState;
  @override
  final State<Position> getCurrentLocationState;

  @override
  String toString() {
    return 'LocationState(getAddressFromLocationCoordinateState: $getAddressFromLocationCoordinateState, getLocationCoordinateFromAddressState: $getLocationCoordinateFromAddressState, getCurrentLocationState: $getCurrentLocationState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.getAddressFromLocationCoordinateState,
                    getAddressFromLocationCoordinateState) ||
                other.getAddressFromLocationCoordinateState ==
                    getAddressFromLocationCoordinateState) &&
            (identical(other.getLocationCoordinateFromAddressState,
                    getLocationCoordinateFromAddressState) ||
                other.getLocationCoordinateFromAddressState ==
                    getLocationCoordinateFromAddressState) &&
            (identical(
                    other.getCurrentLocationState, getCurrentLocationState) ||
                other.getCurrentLocationState == getCurrentLocationState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getAddressFromLocationCoordinateState,
      getLocationCoordinateFromAddressState,
      getCurrentLocationState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState extends LocationState {
  factory _LocationState(
          {required final State<AddressFromLocationModel>
              getAddressFromLocationCoordinateState,
          required final State<dynamic> getLocationCoordinateFromAddressState,
          required final State<Position> getCurrentLocationState}) =
      _$LocationStateImpl;
  _LocationState._() : super._();

  @override
  State<AddressFromLocationModel> get getAddressFromLocationCoordinateState;
  @override
  State<dynamic> get getLocationCoordinateFromAddressState;
  @override
  State<Position> get getCurrentLocationState;
  @override
  @JsonKey(ignore: true)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
