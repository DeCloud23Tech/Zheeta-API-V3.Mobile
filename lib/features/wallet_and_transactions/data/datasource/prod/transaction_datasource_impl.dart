import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasource/transaction_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';



@prod
@Singleton(as: TransactionDataSource)
class TransactionSourceImpl implements TransactionDataSource {
  final Api _api;

  TransactionSourceImpl(this._api);

  @override
  Future<List<TransactionModel>> getAllTransactions(
      {required int pageNumber, required int pageSize, required userId}) async {
    var response = await _api.dio.get(
      '/transaction/get-user-transactions?PageNumber=$pageNumber&PageSize=$pageSize&userId=$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => TransactionModel.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
