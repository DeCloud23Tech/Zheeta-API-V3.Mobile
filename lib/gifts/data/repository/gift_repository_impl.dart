import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';
import 'package:zheeta/gifts/domain/repository/gift_repository.dart';

@prod
@LazySingleton(as: GiftRepository)
class GiftDataRepositoryImpl implements GiftRepository {
  final GiftDataSource _datasource;

  GiftDataRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<GiftModel>> getAllGifts(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getAllGifts(
          pageNumber: pageNumber, pageSize: pageSize);
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
  ResultFuture<List<ReceivedGiftModel>> getAllReceivedGifts(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getAllReceivedGifts(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<SentGiftModel>> getAllSentGifts(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getAllSentGifts(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid redeemGift(String giftId) async {
    try {
      final result = await _datasource.redeemGift(giftId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendGift(SendGiftRequestModel request) async {
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

  @override
  ResultFuture<GiftResponseModel> deliverGift(String giftId) async {
    try {
      final result = await _datasource.deliverGift(giftId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
