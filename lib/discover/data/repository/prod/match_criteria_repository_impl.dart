import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart';

@prod
@LazySingleton(as: MatchCriteriaRepository)
class MatchCriteriaRepositoryImpl implements MatchCriteriaRepository {
  final MatchCriteriaDataSource _datasource;
  MatchCriteriaRepositoryImpl(this._datasource);

  @override
  Future<MatchCriteriaModel> getMatchCriteriaRepo() async {
    final result = await _datasource.getMatchCriteria();
    return result.fold(
      (error) {
        if (error.message == "No Data to Fetch") {
          throw new NoCriteriaException('No Criteria Found');
        } else {
          throw new Exception(error);
        }
      },
      (value) => MatchCriteriaModel.fromJson(value['data']),
    );
  }

  @override
  Future<MatchListModel> getMatchesRepo({required String userId}) async {
    final result = await _datasource.getMatches(userId: userId);
    return result.fold(
      (error) {
        if (error.message == "No Data to Fetch" || error.data == null || error.data == []) {
          throw new NoMatchException('No Match Found');
        } else {
          throw new Exception(error);
        }
      },
      (value) => MatchListModel.fromJson(value),
    );
  }

  @override
  updateMatchCriteriaRepo(MatchCriteriaRequest matchCreteriaRequest) async {
    final result = await _datasource.updateMatchCriteria(matchCreteriaRequest);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }
}
