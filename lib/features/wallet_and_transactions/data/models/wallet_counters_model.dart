import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_counters_model.freezed.dart';
part 'wallet_counters_model.g.dart';

@freezed
abstract class WalletCounters with _$WalletCounters {
  const factory WalletCounters({
    required String userId,
    required double balance,
    required int regularCount,
    required int silverCount,
    required int goldCount,
  }) = _WalletCounters;

  factory WalletCounters.fromJson(Map<String, dynamic> json) =>
      _$WalletCountersFromJson(json);
}
