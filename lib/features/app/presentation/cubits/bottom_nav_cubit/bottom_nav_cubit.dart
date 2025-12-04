import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bottom_nav_state.dart';


@prod
@LazySingleton()
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Default tab index is 0

  void changeTab(int index) {
    emit(index);
  }
}