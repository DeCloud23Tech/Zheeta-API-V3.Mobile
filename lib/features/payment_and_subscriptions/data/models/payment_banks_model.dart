import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_banks_model.freezed.dart';
part 'payment_banks_model.g.dart';

@freezed
abstract class BankProvider with _$BankProvider {
  const factory BankProvider({
    required String code,
    required String name,
  }) = _BankProvider;

  factory BankProvider.fromJson(Map<String, dynamic> json) =>
      _$BankProviderFromJson(json);
}
