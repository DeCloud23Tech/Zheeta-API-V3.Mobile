import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_search_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_search_repository.dart';

@prod
@LazySingleton(as: EventSearchRepository)
class EventSearchRepositoryImpl implements EventSearchRepository {
  final EventSearchDataSource _datasource;

  EventSearchRepositoryImpl(this._datasource);

  @override
  ResultFuture<BuddySearchResponse> searchBuddyEvent(
      {required String searchWord,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.searchBuddyEvent(
        searchWord: searchWord,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
