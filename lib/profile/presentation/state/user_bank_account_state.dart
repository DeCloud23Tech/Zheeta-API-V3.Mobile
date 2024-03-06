import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';

part 'user_bank_account_state.freezed.dart';

@freezed
class UserBankAccountState with _$UserBankAccountState {
  factory UserBankAccountState({
    required State createUpdateBankAccountState,
    required State<BankAccountDetailModel> getLocationCoordinateFromAddressState,
  }) = _UserBankAccountState;

  UserBankAccountState._();

  UserBankAccountState setCreateUpdateBankAccountState(State state) => copyWith(createUpdateBankAccountState: state);
  UserBankAccountState setLocationCoordinateFromAddressState(State<BankAccountDetailModel> state) => copyWith(getLocationCoordinateFromAddressState: state);
}
