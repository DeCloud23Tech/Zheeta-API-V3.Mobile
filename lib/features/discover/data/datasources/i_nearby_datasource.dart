import 'package:zheeta/features/discover/data/models/nearby_model.dart';
import 'package:zheeta/features/discover/data/models/nearby_settings_model.dart';
import 'package:zheeta/features/discover/data/requests/nearby_update_request.dart';

abstract class INearbyDataSource {
  Future<NearbyListDataModel> getNearbyProfiles(
      {required int pageNumber, required int pageSize});

  Future<NearbySettingsModel> getNearbySettings({required String userId});

  Future nearbyUpdate(NearbyUpdateRequest request);
}
