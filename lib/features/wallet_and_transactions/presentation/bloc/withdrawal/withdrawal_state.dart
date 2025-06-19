part of 'withdrawal_cubit.dart';

abstract class WithdrawalState extends Equatable {
  const WithdrawalState();

  @override
  List<Object> get props => [];
}

class WithdrawalInitial extends WithdrawalState {}

class WithdrawalLoading extends WithdrawalState {}

class WithdrawalRate extends WithdrawalState {
  final double rate;

  const WithdrawalRate(this.rate);

  @override
  List<Object> get props => [rate];
}

class WithdrawalSuccess extends WithdrawalState {
  final PayoutData payoutData;

  const WithdrawalSuccess(this.payoutData);

  @override
  List<Object> get props => [payoutData];
}

class WithdrawalFailure extends WithdrawalState {
  final String message;

  const WithdrawalFailure(this.message);

  @override
  List<Object> get props => [message];
}
