import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/features/connections/data/model/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/usecase/ref_usecases/user_downlines_usecase.dart';

part 'downline_state.dart';

@prod
@LazySingleton()
class DownlineCubit extends Cubit<DownlineState> {
  final GetUserDownlines getUserDownlines;

  DownlineCubit({
    required this.getUserDownlines,
  }) : super(const DownlineState());

  Future<void> fetchDownlines(PaginationParam request) async {
    emit(state.copyWith(status: DownlineStatus.loading));
    var result = await getUserDownlines(request);
    result.fold(
      (failure) => emit(state.copyWith(status: DownlineStatus.error)),
      (downlines) => emit(
          state.copyWith(status: DownlineStatus.loaded, downlines: downlines)),
    );
  }
}
