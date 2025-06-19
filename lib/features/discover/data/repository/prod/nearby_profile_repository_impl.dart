import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/discover/data/datasource/nearby_datasource.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';
import 'package:zheeta/features/discover/domain/repository/nearby_repository.dart';

@prod
@LazySingleton(as: NearbyDataRepository)
class NearbyDataRepositoryImpl implements NearbyDataRepository {
  final NearbyDataSource _datasource;

  NearbyDataRepositoryImpl(this._datasource);

  @override
  ResultFuture<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getNearbyProfiles(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<NearbySettingsModel> getNearbySettings({required String userId}) async {
    try {
      final result = await _datasource.getNearbySettings(userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid nearbyUpdate(NearbyUpdateRequest request) async {
    try {
      final result = await _datasource.nearbyUpdate(request);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(
            message: ex.message!, statusCode: ex.response?.statusCode ?? 500),
      );
    }
  }
}
