import 'package:zheeta/discover/data/model/nearby_model.dart';

import '../../../app/common/type_def.dart';

abstract class NearbyDataRepository {
  ResultFuture<NearbyListModel> getNearbyProfiles();
}
