import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../model/nearby_settings_model.dart';

abstract class NearbyDataSource {
  Future<NearbyListDataModel> getNearbyProfiles({required int pageNumber, required int pageSize});
  Future<NearbySettingsModel> getNearbySettings();
}
