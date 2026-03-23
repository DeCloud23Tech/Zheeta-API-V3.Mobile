import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/services/location_service.dart';

@prod
@LazySingleton()
class LocationRepository {
  Future<Position?> getCurrentLocation() async {
    return await LocationService.getCurrentLocation();
  }
}
