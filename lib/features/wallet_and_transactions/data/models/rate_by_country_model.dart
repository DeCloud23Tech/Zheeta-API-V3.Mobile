class RateByCountry {
  final double rate;
  final String currency;

  const RateByCountry({
    required this.rate,
    required this.currency,
  });

  factory RateByCountry.fromJson(Map<String, dynamic> json) {
    return RateByCountry(
      rate: (json['rate'] as num).toDouble(),
      currency: json['currency'] as String? ?? '',
    );
  }
}
