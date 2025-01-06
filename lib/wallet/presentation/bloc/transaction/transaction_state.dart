part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoading extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transactions;

  TransactionLoaded(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

final class TransactionEmpty extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionError extends TransactionState {
  final String message;

  TransactionError(this.message);

  @override
  List<Object?> get props => [message];
}
