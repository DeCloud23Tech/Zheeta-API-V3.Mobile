import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/charges_model.dart';
import '../../../domain/usecase/get_charges_usecase.dart';

part 'charges_state.dart';

@prod
@LazySingleton()
class ChargesCubit extends Cubit<ChargesState> {
  GetAllCharges getAllCharges;

  ChargesCubit({
    required this.getAllCharges,
  }) : super(ChargesInitial());

  Future<ChargesListModel?> getAllChargesCubit() async {
    emit(ChargesLoading());
    var result = await getAllCharges();
    ChargesListModel? data;
    result.fold(
      (fail) {
        emit(ChargesError(fail.message));
      },
      (success) {
        emit(ChargesSuccess(success));
        data = success;
      },
    );
    return data;
  }
}
