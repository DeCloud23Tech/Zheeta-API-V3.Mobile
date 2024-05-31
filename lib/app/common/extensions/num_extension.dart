extension DoubleExtension on double {
  int get roundToInt => this.round();
  double get roundTo2dp => double.parse(this.toStringAsFixed(2));
}
