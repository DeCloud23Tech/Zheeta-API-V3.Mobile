import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';

import '../../../../app/api/errors/error.dart';
import '../../../../app/api/errors/exception.dart';
import '../datasource/gift_datasource.dart';

@prod
@LazySingleton(as: GiftRepository)
class GiftDataRepositoryImpl implements GiftRepository {
  final GiftDataSource _datasource;

  GiftDataRepositoryImpl(this._datasource);

  @override
  ResultFuture<GiftListModel> getAllGifts(int page) async {
    try {
      final result = await _datasource.getAllGifts(page);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<GiftModel> getGiftById(String id) {
    // TODO: implement getGiftById
    throw UnimplementedError();
  }

  @override
  ResultFuture<ReceivedGiftListModel> getAllReceivedGifts(int page) async {
    try {
      final result = await _datasource.getAllReceivedGifts(page);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<SentGiftListModel> getAllSentGifts(int page) async {
    try {
      final result = await _datasource.getAllSentGifts(page);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<GiftResponseModel> redeemGiftById(String giftId) async {
    try {
      final result = await _datasource.redeemGiftById(giftId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<GiftResponseModel> sendGift(SendGiftRequestModel request) async {
    try {
      final result = await _datasource.sendGift(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
