import 'package:freezed_annotation/freezed_annotation.dart';

part 'zheeta_wallet_model.freezed.dart';
part 'zheeta_wallet_model.g.dart';

@freezed
class ZheetaWalletModel with _$ZheetaWalletModel {
  factory ZheetaWalletModel({
    required int id,
    required String subscriptionSum,
    required String withdrawalSum,
    required String totalWalletSum,
    required String affiliateSum,
    required String profileBoostSum,
    required DateTime lastTransactionDate,
  }) = _ZheetaWalletModel;

  factory ZheetaWalletModel.fromJson(Map<String, dynamic> json) =>
      _$ZheetaWalletModelFromJson(json);
}
