import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/wallet/domain/repository/withdrawal_repository.dart';

@prod
@LazySingleton()
class GetRateByCountry extends UsecaseWithParams<double, String> {
  const GetRateByCountry(this._repo);

  final WithdrawalRepository _repo;

  @override
  ResultFuture<double> call(String countryName) async {
    return await _repo.getRateByCountry(countryName: countryName);
  }
}
