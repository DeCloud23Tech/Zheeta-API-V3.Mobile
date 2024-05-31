import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/model/nearby_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

abstract class NearbyDataSource {
  Future<NearbyListModel> getNearbyProfiles();
}
