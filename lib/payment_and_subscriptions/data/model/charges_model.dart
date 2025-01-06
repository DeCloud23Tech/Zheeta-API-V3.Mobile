import 'package:freezed_annotation/freezed_annotation.dart';

part 'charges_model.freezed.dart';
part 'charges_model.g.dart';

@freezed
class ChargesListModel with _$ChargesListModel {
  const factory ChargesListModel({
    required List<Charge> data,
  }) = _ChargesListModel;

  factory ChargesListModel.fromJson(Map<String, dynamic> json) =>
      _$ChargesListModelFromJson(json);
}

@freezed
class Charge with _$Charge {
  const factory Charge({
    required int id,
    required String title,
    required double amount,
    required DateTime lastModifiedDate,
    required DateTime createdDate,
  }) = _Charge;

  factory Charge.fromJson(Map<String, dynamic> json) =>
      _$ChargeFromJson(json);
}
