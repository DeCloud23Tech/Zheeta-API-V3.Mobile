import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zheeta/core/mixin/location_helper.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/features/discover/presentation/widgets/distance_filter_buttons.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

class NearbyFilter {
  final double? latitude;
  final double? longitude;
  final String selectedGender;
  final String selectedDistance;

  NearbyFilter({
    required this.latitude,
    required this.longitude,
    required this.selectedGender,
    required this.selectedDistance,
  });
}

Future<NearbyFilter?> nearbyFilterBottomSheetView(
  BuildContext context, {
  NearbyFilter? initialFilter,
}) async {
  final result = await showModalBottomSheet<NearbyFilter?>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.47),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return NearbyFilterBottomSheet(initialFilter: initialFilter);
    },
  );
  return result;
}

class NearbyFilterBottomSheet extends StatefulWidget {
  final NearbyFilter? initialFilter;

  const NearbyFilterBottomSheet({super.key, this.initialFilter});

  @override
  State<NearbyFilterBottomSheet> createState() =>
      _NearbyFilterBottomSheetViewState();
}

class _NearbyFilterBottomSheetViewState extends State<NearbyFilterBottomSheet>
    with LocationHelperMixin {
  double? latitude;
  double? longitude;
  late String _selectedDistance;
  late String _selectedGender;

  final List<String> distances = [
    '5km',
    '10km',
    '20km',
    '30km',
    '50km',
    '70km',
    '100km',
  ];

  @override
  void initState() {
    super.initState();

    // Initialize with provided filter or defaults
    latitude = widget.initialFilter?.latitude;
    longitude = widget.initialFilter?.longitude;
    _selectedDistance = widget.initialFilter?.selectedDistance ?? '5km';
    _selectedGender = widget.initialFilter?.selectedGender ?? 'Male';

    // Fetch location if not available
    if (latitude == null || longitude == null) {
      _getLocation();
    }
  }

  Future<void> _getLocation() async {
    try {
      final position = await getCurrentLocation(context);
      if (!mounted) return;
      if (position != null) {
        setState(() {
          latitude = position.latitude;
          longitude = position.longitude;
        });
      } else {
        NotifyUser.showSnackBar(
            'Error getting location, Please try again later.');
      }
    } on Exception catch (_) {
      final status = await Permission.locationWhenInUse.request();

      if (!mounted) return;
      if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Location permission is required to use this feature.',
            ),
          ),
        );
      } else if (status.isPermanentlyDenied) {
        if (!mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Grant location access'),
              content: const Text(
                'We are unable to locate you. Kindly grant app permission to access your location for the Nearby feature to work.',
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Open Settings',
                    action: () async {
                      if (!mounted) return;
                      Navigator.pop(context); // Close dialog
                      Navigator.pop(context); // Close bottom sheet
                      await openAppSettings();
                    },
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xffFFF1F7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle drag bar
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xffDADADA),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBackButton(
                  icon: Icons.close,
                  onTap: () => Navigator.pop(context),
                ),
                const Text(
                  'Nearby filter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 40, height: 40),
              ],
            ),
            const SizedBox(height: 20),

            // Gender
            const Text(
              'Gender',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            DropdownInputField(
              value: _selectedGender,
              hintText: 'Select gender',
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedGender = value);
                }
              },
              items: const ['Male', 'Female'],
            ),
            const SizedBox(height: 10),

            // Distance
            const Text(
              'Distance from you',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            DistanceFilterRow(
              distances: distances,
              selectedDistance: _selectedDistance,
              onDistanceSelected: (distance) {
                setState(() {
                  _selectedDistance = distance;
                });
              },
            ),
            const SizedBox(height: 30),

            // Apply button
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                action: () {
                  final filter = NearbyFilter(
                    latitude: latitude,
                    longitude: longitude,
                    selectedGender: _selectedGender,
                    selectedDistance: _selectedDistance,
                  );
                  Navigator.pop(context, filter);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
