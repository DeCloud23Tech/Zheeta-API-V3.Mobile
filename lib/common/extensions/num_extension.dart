extension DoubleExtension on double {
  int get roundToInt => round();
  double get roundTo2dp => double.parse(toStringAsFixed(2));
}
