import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../../../../app/api/errors/error.dart';
import '../../../../app/api/errors/exception.dart';
import '../../../domain/repository/populate_nearby_repository.dart';
import '../../datasource/nearby_datasource.dart';
import '../../model/nearby_settings_model.dart';

@prod
@LazySingleton(as: NearbyDataRepository)
class NearbyDataRepositoryImpl implements NearbyDataRepository {
  final NearbyDataSource _datasource;

  NearbyDataRepositoryImpl(this._datasource);

  @override
  ResultFuture<NearbyListModel> getNearbyProfiles() async {
    try {
      final result = await _datasource.getNearbyProfiles();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<NearbySettingsModel> getNearbySettings() async {
    try {
      final result = await _datasource.getNearbySettings();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}