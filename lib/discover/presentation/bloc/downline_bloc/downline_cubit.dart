import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/common/param/pagination_param.dart';
import '../../../data/model/user_downline_model.dart';
import '../../../domain/usecase/ref/user_downlines_usecase.dart';

part 'downline_state.dart';

@prod
@LazySingleton()
class DownlineCubit extends Cubit<DownlineState> {
  final GetUserDownlines getUserDownlines;

  static const _pageSize = 10;

  DownlineCubit({
    required this.getUserDownlines,
  }) : super(const DownlineState());

  void reset() {
    emit(const DownlineState()); // Emit the initial state
  }

  Future<void> fetchDownlines({int currentPage = 1}) async {
    if (state.isFetching || state.hasReachedMax) {
      print('Request already in progress or max pages reached.');
      return;
    }

    emit(state.copyWith(isFetching: true));

    try {
      List<UserDownlineModel> downlines;

      if (state.status == DownlineStatus.initial || state.status == DownlineStatus.loading) {
        print('Fetching initial page: $currentPage');
        downlines = await _fetchDownlines(currentPage);
        emit(
          state.copyWith(
            status: DownlineStatus.loaded,
            downlines: downlines,
            currentPage: currentPage + 1,
            isFetching: false,
          ),
        );
      } else {
        print('Fetching next page: ${state.currentPage}');
        downlines = await _fetchDownlines(state.currentPage);
        emit(
          downlines.isEmpty
              ? state.copyWith(hasReachedMax: true, isFetching: false)
              : state.copyWith(
            status: DownlineStatus.loaded,
            downlines: List.of(state.downlines)..addAll(downlines),
            currentPage: state.currentPage + 1,
            isFetching: false,
          ),
        );
      }
    } catch (e) {
      print('Error fetching downlines: $e');
      emit(state.copyWith(status: DownlineStatus.error, errorMessage: e.toString(), isFetching: false));
    }
  }

  Future<List<UserDownlineModel>> _fetchDownlines(int pageNo) async {
    print('Fetching downlines for page number: $pageNo');
    var result = await getUserDownlines(
      PaginationParam(pageNo: pageNo, pageSize: _pageSize),
    );
    return result.fold(
          (failure) => throw Exception(failure.message),
          (success) => success,
    );
  }
}
