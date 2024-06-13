import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_model.freezed.dart';
part 'gift_model.g.dart';

@freezed
class GiftModel with _$GiftModel {
  factory GiftModel({
    required String imageUrl,
    required String title,
    required double amount,
    required String id,
    required String partitionKey,
    String? lastModifiedDate,
    String? createdDate,
  }) = _GiftModel;

  factory GiftModel.fromJson(Map<String, dynamic> json) => _$GiftModelFromJson(json);
}

@freezed
class GiftListModel with _$GiftListModel {
  factory GiftListModel({
    required List<GiftModel> data,
  }) = _GiftListModel;

  factory GiftListModel.fromJson(Map<String, dynamic> json) => _$GiftListModelFromJson(json);
}
