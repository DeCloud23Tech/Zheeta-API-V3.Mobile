import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

mixin LocationHelperMixin {
  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw new Exception('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw new Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw new Exception('Location permissions are permanently denied, we cannot request permissions.');
    }
    final position = await Geolocator.getCurrentPosition();
    await getAddressFromLatLang(position);
    return position;
  }

  Future<Placemark?> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    return place;
  }
}
