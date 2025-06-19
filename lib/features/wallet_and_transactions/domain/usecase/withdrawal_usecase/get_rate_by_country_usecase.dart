import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/transaction_repository.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/withdrawal_repository.dart';

@prod
@LazySingleton()
class GetRateByCountry extends UsecaseWithParams<double, String> {
  const GetRateByCountry(this._repo);

  final WithdrawalRepository _repo;

  @override
  ResultFuture<double> call(String params) async {
    return await _repo.getRateByCountry(countryName: params);
  }
}


