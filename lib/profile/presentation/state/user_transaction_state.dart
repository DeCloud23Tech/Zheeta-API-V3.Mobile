import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';

part 'user_transaction_state.freezed.dart';

@freezed
class UserTransactionState with _$UserTransactionState {
  factory UserTransactionState({
    required State<UserTransactionListModel> getUserTransactionsState,
  }) = _UserTransactionState;

  UserTransactionState._();

  UserTransactionState setGetUserTransactionsState(State<UserTransactionListModel> state) => copyWith(getUserTransactionsState: state);
}
