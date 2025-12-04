import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/models/nearby_model.dart';
import 'package:zheeta/features/discover/data/models/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/requests/nearby_update_request.dart';

abstract class INearbyDataRepository {
  ResultFuture<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize});

  ResultFuture<NearbySettingsModel> getNearbySettings({required String userId});

  ResultVoid nearbyUpdate(NearbyUpdateRequest request);
}
