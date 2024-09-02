import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/gifts/data/datasource/gift_datasource.dart';
import 'package:zheeta/gifts/data/model/gift_model.dart';
import 'package:zheeta/gifts/data/model/gift_response_model.dart';
import 'package:zheeta/gifts/data/model/received_gift_model.dart';
import 'package:zheeta/gifts/data/model/sent_gift_model.dart';
import 'package:zheeta/gifts/data/request/send_gift_request_model.dart';

@prod
@Singleton(as: GiftDataSource)
class GiftDataSourceImpl implements GiftDataSource {
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
      List<dynamic> data = response.data['data'];
      return data.map((json) => GiftModel.fromJson(json)).toList();
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      List<dynamic> data = response.data['data'];
      return data.map((json) => ReceivedGiftModel.fromJson(json)).toList();
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      List<dynamic> data = response.data['data'];
      return data.map((json) => SentGiftModel.fromJson(json)).toList();
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      return GiftResponseModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<GiftResponseModel> sendGift(SendGiftRequestModel request) async {
    var response = await _api.dio.post('/gift/send-gift-to-customer',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
      return GiftResponseModel.fromJson(response.data);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }


}
