import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';

abstract class NearbyDataRepository {
  ResultFuture<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize});

  ResultFuture<NearbySettingsModel> getNearbySettings({required String userId});

  ResultVoid nearbyUpdate(NearbyUpdateRequest request);
}
