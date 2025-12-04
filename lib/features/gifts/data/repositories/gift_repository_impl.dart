import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/gifts/data/datasources/i_gift_datasource.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton(as: IGiftRepository)
class GiftDataRepositoryImpl implements IGiftRepository {
  final IGiftDataSource _datasource;

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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
