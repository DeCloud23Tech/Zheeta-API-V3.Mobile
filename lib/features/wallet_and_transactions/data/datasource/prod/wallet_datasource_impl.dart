import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasource/wallet_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';

@prod
@Singleton(as: WalletDataSource)
class WalletDataSourceImpl implements WalletDataSource {
  final Api _api;

  WalletDataSourceImpl(this._api);

  @override
  Future<WalletCounters> getZheetaWallet() async {
    final response = await _api.dio.get(
      '/wallet/get-wallet-counters',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return WalletCounters.fromJson(response.data['data']);
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
    required String receiverUsername,
    required String message,
    required double amount,
  }) async {
    final response = await _api.dio.post(
      '/wallet/transfer-to-user-wallet',
      data: {
        'receiverUsername': receiverUsername,
        'amount': amount,
        if (message.isNotEmpty) 'message': message
      },
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
