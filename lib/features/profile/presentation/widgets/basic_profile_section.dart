import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';

class BasicProfileSection extends StatelessWidget {
  final UserProfileDataModel? user;

  const BasicProfileSection({
    super.key,
    required this.user,
  });

  String? _formatMeasurement(double? value, String unit) {
    if (value == null) return null;
    final formatted = value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(1);
    return '$formatted$unit';
  }

  String? _formatRelationship(int? maritalStatus) {
    if (maritalStatus == null) return null;
    if (maritalStatus < 0 || maritalStatus >= AppLists.maritalStatus.length) {
      return null;
    }
    return AppLists.maritalStatus[maritalStatus];
  }

  String? _cleanValue(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    return trimmed;
  }

  @override
  Widget build(BuildContext context) {
    final profile = user?.profile;
    final language = _cleanValue(profile?.languageCSV);
    final entries = <_BasicProfileEntry>[
      _BasicProfileEntry('Height', _formatMeasurement(profile?.height, 'cm')),
      _BasicProfileEntry('Weight', _formatMeasurement(profile?.weight, 'kg')),
      _BasicProfileEntry('Body type', _cleanValue(profile?.bodyType)),
      _BasicProfileEntry('Occupation', _cleanValue(profile?.occupation)),
      _BasicProfileEntry('Complexion', _cleanValue(profile?.complexion)),
      _BasicProfileEntry('Religion', _cleanValue(profile?.religion)),
      _BasicProfileEntry('Language', language),
      _BasicProfileEntry(
        'Relationship',
        _formatRelationship(profile?.maritalStatus),
      ),
    ].where((entry) => entry.value != null).toList();
    final leftColumnEntries = entries.take(5).toList();
    final rightColumnEntries = entries.skip(5).toList();

    if (entries.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic profile',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: leftColumnEntries
                      .map((entry) => _BasicProfileItem(entry: entry))
                      .toList(),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rightColumnEntries
                      .map((entry) => _BasicProfileItem(entry: entry))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _BasicProfileItem extends StatelessWidget {
  final _BasicProfileEntry entry;

  const _BasicProfileItem({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppColors.grayscale,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: '${entry.label}: ',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: entry.value!,
              style: const TextStyle(
                color: AppColors.grayscaleBody,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BasicProfileEntry {
  final String label;
  final String? value;

  const _BasicProfileEntry(this.label, this.value);
}
