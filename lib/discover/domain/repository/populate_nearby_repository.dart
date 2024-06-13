import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../../../app/common/type_def.dart';
import '../../data/model/nearby_settings_model.dart';

abstract class NearbyDataRepository {
  ResultFuture<NearbyListModel> getNearbyProfiles();
  ResultFuture<NearbySettingsModel> getNearbySettings();

}
