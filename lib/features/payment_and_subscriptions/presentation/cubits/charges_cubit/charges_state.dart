part of 'charges_cubit.dart';

abstract class ChargesState extends Equatable {
  const ChargesState();
}

class ChargesInitial extends ChargesState {
  @override
  List<Object> get props => [];
}

class ChargesLoading extends ChargesState {
  @override
  List<Object> get props => [];
}

class ChargesError extends ChargesState {
  final String errorMessage;

  const ChargesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ChargesSuccess extends ChargesState {
  final ChargesListModel charges;

  const ChargesSuccess(this.charges);

  @override
  List<Object> get props => [charges];
}
