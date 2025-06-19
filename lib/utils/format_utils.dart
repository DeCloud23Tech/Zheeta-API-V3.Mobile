import 'package:intl/intl.dart';

String formatCount(int? count) {
  if (count == null) return '0';
  if (count >= 1000000) {
    return '${(count / 1000000).toStringAsFixed(1)}M'; // For millions
  } else if (count >= 1000) {
    return '${(count / 1000).toStringAsFixed(1)}k'; // For thousands
  }
  return count.toString(); // For small numbers
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


String formatCurrency(double amount) {
  final formatter = NumberFormat("#,##0.00", "en_US");
  return formatter.format(amount);
}

