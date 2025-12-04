import 'package:intl/intl.dart';
import 'package:zheeta/core/utils/extensions/double_extension.dart';

extension StringExtension on String {
  String get getFirstLetter => isNotEmpty ? this[0] : '';
  int get roundToInt => double.parse(this).roundToInt;
  double get toDouble => double.parse(this);

  String get toDateTime {
    DateTime? formatted = DateTime.tryParse(this);
    if (formatted != null) {
      return DateFormat('dd MMM yyyy').format(formatted);
    } else {
      return '';
    }
  }

  // DateTime to age
  int get dateToAge {
    DateTime? formatted = DateTime.tryParse(this);
    if (formatted != null) {
      final now = DateTime.now();
      int age = now.year - formatted.year;
      if (now.month < formatted.month ||
          (now.month == formatted.month && now.day < formatted.day)) {
        age--; // Adjust if birthday hasn't occurred yet this year
      }
      return age;
    } else {
      return 0;
    }
  }

  /// Capitalize first letter of each word and add space for camelCase or underscores
  String get capitalizeFirstOfEach {
    // Replace underscores with spaces first
    String result = replaceAll('_', ' ');

    // Add space before uppercase letters that are preceded by lowercase letters
    result = result.replaceAllMapped(
        RegExp(r'(?<=[a-z])([A-Z])'), (match) => ' ${match.group(0)}');

    // Capitalize first letter of each word
    result = result
        .split(' ')
        .map((word) =>
    word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' ');

    return result.trim();
  }
}

int getMaritalStatusCode(String? maritalStatus) {
  switch (maritalStatus) {
    case 'Single':
      return 1;
    case 'Married':
      return 2;
    case 'Divorced':
      return 3;
    case 'Widowed':
      return 4;
    case 'Separated':
      return 5;
    default:
      return 6; // Default for other or unknown statuses
  }
}

String? formatDateOfBirth(String? dateOfBirth) {
  if (dateOfBirth == null) return null;
  try {
    final DateFormat inputFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
    final DateFormat outputFormat = DateFormat("yyyy-MM-dd");

    DateTime parsedDate = inputFormat.parse(dateOfBirth);
    return outputFormat.format(parsedDate);
  } catch (e) {
    print("Error parsing date: $e");
    return null;
  }
}

String formatEventDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString); // Convert string to DateTime
    DateFormat formatter = DateFormat("d, MMMM yyyy - h a"); // Desired format
    return formatter.format(date); // Format and return
  } catch (e) {
    print("Error formatting date: $e");
    return "Invalid date";
  }
}
