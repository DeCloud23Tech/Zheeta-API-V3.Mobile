extension CountFormatter on int? {
  String toAbbreviatedCount() {
    if (this == null) return '0'; // Handle null case explicitly

    final int number = this!; // Use a non-nullable local variable

    if (number >= 1000000) {
      double value = number / 1000000;
      // Use a regex to remove trailing .0 if it exists
      String formatted = value.toStringAsFixed(1);
      return '${formatted.replaceAll(RegExp(r'\.0$'), '')}M';
    } else if (number >= 1000) {
      double value = number / 1000;
      // Use a regex to remove trailing .0 if it exists
      String formatted = value.toStringAsFixed(1);
      return '${formatted.replaceAll(RegExp(r'\.0$'), '')}k';
    }
    return number
        .toString(); // For numbers less than 1000, just return as string
  }
}
