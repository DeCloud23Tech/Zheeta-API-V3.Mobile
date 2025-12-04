import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasources/i_event_search_datasource.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_search_repository.dart';

@prod
@LazySingleton(as: IEventSearchRepository)
class EventSearchRepositoryImpl implements IEventSearchRepository {
  final IEventSearchDataSource _datasource;

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
