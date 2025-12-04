import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_transaction_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';

@prod
@Singleton(as: ITransactionDataSource)
class TransactionSourceImpl implements ITransactionDataSource {
  final Api _api;

  TransactionSourceImpl(this._api);

  @override
  Future<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  }) async {
    // 🔹 Log the request parameters
    print('[TransactionSourceImpl] getAllTransactions called with: '
        'pageNumber=$pageNumber, pageSize=$pageSize, userId=$userId');

    var response = await _api.dio.get(
      '/transaction/get-user-transactions?PageNumber=$pageNumber&PageSize=$pageSize&userId=$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    // 🔹 Log the raw response
    print('[TransactionSourceImpl] Response status: ${response.statusCode}');
    print('[TransactionSourceImpl] Response data: ${response.data}');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      print('[TransactionSourceImpl] Parsed ${data.length} transactions');
      return data.map((json) => TransactionModel.fromJson(json)).toList();
    } else {
      print('[TransactionSourceImpl] Error fetching transactions: '
          '${response.statusCode}');
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
