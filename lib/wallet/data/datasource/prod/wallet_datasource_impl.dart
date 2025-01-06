import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/wallet/data/datasource/wallet_datasource.dart';
import 'package:zheeta/wallet/data/model/zheeta_wallet_model.dart';

@prod
@Singleton(as: WalletDataSource)
class WalletDataSourceImpl implements WalletDataSource {
  final Api _api;

  WalletDataSourceImpl(this._api);

  @override
  Future<double> getTotalWalletAmount() async {
    final response = await _api.dio.get(
      '/api/wallet/get-total-wallet-amount',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return response.data['totalWalletAmount'];
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<double> getUserAvailableBalance({required String userId}) async {
    final response = await _api.dio.get(
      '/api/wallet/get-user-available-balance',
      queryParameters: {'userId': userId},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return response.data['availableBalance'];
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<ZheetaWalletModel> getZheetaWallet({required String id}) async {
    final response = await _api.dio.get(
      '/api/wallet/zheeta-wallet',
      queryParameters: {'id': id},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return ZheetaWalletModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> transferToUserWallet({
    required String fromUserId,
    required String toUserId,
    required double amount,
  }) async {
    final response = await _api.dio.post(
      '/api/wallet/transfer-to-user-wallet',
      data: jsonEncode({
        'fromUserId': fromUserId,
        'toUserId': toUserId,
        'amount': amount,
      }),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode != 200) {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
