import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app_settings/app_settings.dart';

mixin LocationHelperMixin {
  void openAppSettings() {
    AppSettings.openAppSettings();
  }

  Future<Position?> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!context.mounted) return null;
      bool openSettings = await _showLocationDialog(context);
      if (!openSettings) return null;

      await Geolocator.openLocationSettings();
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (!context.mounted) return null;
      await _showLocationDialog(context, permanentlyDenied: true);
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    await getAddressFromLatLang(position);
    return position;
  }

  Future<Placemark?> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemark.isNotEmpty ? placemark[0] : null;
  }

  Future<bool> _showLocationDialog(BuildContext context,
      {bool permanentlyDenied = false}) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Location Required"),
            content: Text(permanentlyDenied
                ? "Location access is permanently denied. Please enable it in your device settings."
                : "This app requires location access to function properly."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: openAppSettings,
                child: const Text("Go to Settings"),
              ),
            ],
          ),
        ) ??
        false;
  }
}
