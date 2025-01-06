part of 'withdrawal_cubit.dart';

abstract class WithdrawalState extends Equatable {
  const WithdrawalState();
}

final class WithdrawalInitial extends WithdrawalState {
  @override
  List<Object> get props => [];
}

final class WithdrawalLoading extends WithdrawalState {
  @override
  List<Object> get props => [];
}

final class WithdrawalSuccess extends WithdrawalState {
  final String message;

  const WithdrawalSuccess(this.message);

  @override
  List<Object> get props => [];
}

final class WithdrawalFailure extends WithdrawalState {
  final String error;

  const WithdrawalFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class WithdrawalRate extends WithdrawalState {
  final double rate;

  const WithdrawalRate(this.rate);

  @override
  List<Object> get props => [rate];
}
