import 'package:intl/intl.dart';
extension DoubleExtension on double {
  int get roundToInt => round();
  double get roundTo2dp => double.parse(toStringAsFixed(2));
}

extension CurrencyFormatter on double {
  String toFormattedCurrency() {
    final formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(this);
  }
}

// int? count = 1200000;
// print(count.toAbbreviatedCount()); // "1.2M"
//
// String? dob = "01/15/1995 00:00:00";
// print(dob.toFormattedDOB()); // "1995-01-15"
//
// String dateString = "2025-07-01T12:00:00Z";
// print(dateString.toFormattedEventDate()); // "1, July 2025 - 12 PM"
//
// String? status = "Divorced";
// print(status.toMaritalStatusCode()); // 3
//
// double amount = 12345.678;
// print(amount.toFormattedCurrency()); // "12,345.68"
