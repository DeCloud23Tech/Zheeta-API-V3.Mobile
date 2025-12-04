import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasources/i_event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_verification_repository.dart';

@prod
@LazySingleton(as: IEventVerificationRepository)
class EventVerificationRepositoryImpl implements IEventVerificationRepository {
  final IEventVerificationDataSource _datasource;

  EventVerificationRepositoryImpl(this._datasource);

  @override
  ResultFuture<BuddyEventVerification?> getBuddyEventVerificationById(
      {required String id}) async {
    try {
      var result = await _datasource.getBuddyEventVerificationById(id: id);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
