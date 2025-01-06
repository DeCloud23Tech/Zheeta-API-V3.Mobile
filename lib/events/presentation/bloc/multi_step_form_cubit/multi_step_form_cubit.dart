import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class MultiStepFormCubit extends Cubit<int> {
  final int totalSteps;

  MultiStepFormCubit({required this.totalSteps}) : super(1);

  void nextStep() {
    if (state < totalSteps) {
      emit(state + 1);
    }
  }

  void previousStep() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
