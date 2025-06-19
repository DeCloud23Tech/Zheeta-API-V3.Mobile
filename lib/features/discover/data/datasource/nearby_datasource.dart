import 'package:zheeta/features/discover/data/model/nearby_model.dart';
import 'package:zheeta/features/discover/data/model/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/request/nearby_update_request.dart';

abstract class NearbyDataSource {
  Future<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize});

  Future<NearbySettingsModel> getNearbySettings({required String userId});

  Future nearbyUpdate(NearbyUpdateRequest request);
}
