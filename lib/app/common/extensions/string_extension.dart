import 'package:intl/intl.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';

extension StringExtension on String {
  String get getFirstLetter => this[0];
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
      return DateTime.now().year - formatted.year;
    } else {
      return 0;
    }
  }
}
