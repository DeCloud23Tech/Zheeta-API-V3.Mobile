import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/gifts/data/datasources/i_gift_datasource.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/data/models/gift_response_model.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/data/requests/send_gift_request_model.dart';

@prod
@Singleton(as: IGiftDataSource)
class GiftDataSourceImpl implements IGiftDataSource {
  final Api _api;

  GiftDataSourceImpl(this._api) {}

  @override
  Future<List<GiftModel>> getAllGifts(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/gift/get-all-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => GiftModel.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<List<ReceivedGiftModel>> getAllReceivedGifts(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/gift/get-all-received-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => ReceivedGiftModel.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<List<SentGiftModel>> getAllSentGifts(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/gift/get-all-sent-gifts?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => SentGiftModel.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<GiftModel> getGiftById(String id) {
    // TODO: implement getGiftById
    throw UnimplementedError();
  }

  @override
  Future<GiftResponseModel> redeemGift(String giftId) async {
    var response = await _api.dio.post(
      '/gift/redeem-gift/$giftId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return GiftResponseModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<GiftResponseModel> sendGift(SendGiftRequestModel request) async {
    var response = await _api.dio.post('/gift/send-gift-to-customer',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));

    if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
      return GiftResponseModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<GiftResponseModel> deliverGift(String giftId) async {
    var response = await _api.dio.post(
      '/gift/deliver-gift/$giftId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return GiftResponseModel.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
