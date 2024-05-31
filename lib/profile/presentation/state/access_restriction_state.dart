import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'access_restriction_state.freezed.dart';

@freezed
class AccessRestrictionState with _$AccessRestrictionState {
  factory AccessRestrictionState({
    required State enableAccountState,
    required State disableAccountState,
  }) = _AccessRestrictionState;

  AccessRestrictionState._();

  AccessRestrictionState setEnableAccountState(State state) => copyWith(enableAccountState: state);
  AccessRestrictionState setDisableAccountState(State state) => copyWith(disableAccountState: state);
}
