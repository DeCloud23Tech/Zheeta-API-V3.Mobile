import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/rate_by_country_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/withdrawal_repository.dart';

@prod
@LazySingleton()
class GetRateByCountry extends UsecaseWithParams<RateByCountry, String> {
  const GetRateByCountry(this._repo);

  final IWithdrawalRepository _repo;

  @override
  ResultFuture<RateByCountry> call(String params) async {
    return await _repo.getRateByCountry(countryName: params);
  }
}
