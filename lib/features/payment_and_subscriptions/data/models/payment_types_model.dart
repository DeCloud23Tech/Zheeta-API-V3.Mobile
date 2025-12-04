import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_types_model.freezed.dart';
part 'payment_types_model.g.dart';

@freezed
abstract class PaymentType with _$PaymentType {
  factory PaymentType({
    required int id,
    required String name,
  }) = _PaymentType;

  factory PaymentType.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeFromJson(json);
}
