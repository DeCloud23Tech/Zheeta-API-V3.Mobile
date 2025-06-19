import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_verification_repository.dart';



@prod
@LazySingleton(as: EventVerificationRepository)
class EventVerificationRepositoryImpl implements EventVerificationRepository {
  final EventVerificationDataSource _datasource;

  EventVerificationRepositoryImpl(this._datasource);


  @override
  ResultFuture<BuddyEventVerification?> getBuddyEventVerificationById({required String id}) async {
    try {
      var result = await _datasource.getBuddyEventVerificationById(id: id);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
