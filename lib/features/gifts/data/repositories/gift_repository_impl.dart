import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart';

@prod
@LazySingleton(as: IGiftRepository)
class GiftDataRepositoryImpl implements IGiftRepository {
  final Api _api;

  GiftDataRepositoryImpl(this._api);

  @override
  ResultFuture<List<GiftModel>> getAllGifts(
      {required int pageNumber, required int pageSize}) async {
    try {
      final response = await _api.dio.get(
        '/gift/get-all-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        final data = List<dynamic>.from(response.data['data'] ?? []);
        return right(data.map((json) => GiftModel.fromJson(json)).toList());
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
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
      final response = await _api.dio.get(
        '/gift/get-all-received-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        final data = List<dynamic>.from(response.data['data'] ?? []);
        return right(
            data.map((json) => ReceivedGiftModel.fromJson(json)).toList());
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
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
      final response = await _api.dio.get(
        '/gift/get-all-sent-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        final data = List<dynamic>.from(response.data['data'] ?? []);
        return right(data.map((json) => SentGiftModel.fromJson(json)).toList());
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
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
      final Response<dynamic> response = await _api.dio.post(
        '/gift/redeem-gift/$giftId',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        return right(null);
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
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
      final Response<dynamic> response = await _api.dio.post(
        '/gift/send-gift-to-customer',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
        return right(null);
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
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
      final response = await _api.dio.post(
        '/gift/deliver-gift/$giftId',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        return right(GiftResponseModel.fromJson(response.data['data']));
      }

      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
