import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/wallet/data/datasource/withdrawal_datasource.dart';
import 'package:zheeta/wallet/data/model/banks_model.dart';
import 'package:zheeta/wallet/data/model/pay_out_model.dart';

@prod
@Singleton(as: WithdrawalDataSource)
class WithdrawalDataSourceImpl implements WithdrawalDataSource {
  final Api _api;

  WithdrawalDataSourceImpl(this._api);

  @override
  Future<List<BankModel>> getAllBanks({String? countryIso2Code}) {
    // TODO: implement getAllBanks
    throw UnimplementedError();
  }

  @override
  Future<List<BankModel>> getBankBranches({required String id}) {
    // TODO: implement getBankBranches
    throw UnimplementedError();
  }

  @override
  Future<double> getRateByCountry({required String countryName}) async {
    var response = await _api.dio.get(
      '/payment/get-rate-by-country',
      queryParameters: {'countryName': countryName},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<PayoutDataModel> processPayOut(
      {required double coinAmount, required String payOutAccountId}) {
    // TODO: implement processPayOut
    throw UnimplementedError();
  }
}
