import 'package:intl/intl.dart';

extension FormattedDate on DateTime? {
  /// Returns a formatted string like "1st Jan 2025".
  String toReadableDate() {
    if (this == null) return 'Unknown date';

    DateTime parsedDate = this!;

    String daySuffix(int day) {
      if (day >= 11 && day <= 13) return 'th';
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    final day = parsedDate.day;
    final suffix = daySuffix(day);
    final month = DateFormat('MMM').format(parsedDate);
    final year = parsedDate.year;

    return '$day$suffix $month $year';
  }
}

DateTime? parseCustomDate(String? date) {
  if (date == null) return null;

  // Try ISO format first
  try {
    return DateTime.parse(date);
  } catch (_) {}

  // Try MM/dd/yyyy HH:mm:ss
  try {
    return DateFormat('MM/dd/yyyy HH:mm:ss').parse(date);
  } catch (_) {}

  return null; // invalid date
}
