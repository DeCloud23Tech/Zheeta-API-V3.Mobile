import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_from_location_model.freezed.dart';
part 'address_from_location_model.g.dart';

@freezed
class AddressFromLocationModel with _$AddressFromLocationModel {
  @JsonSerializable()
  factory AddressFromLocationModel({
    dynamic streetNumber,
    dynamic address,
    dynamic country,
    dynamic state,
    dynamic city,
    dynamic postalCode,
  }) = _AddressFromLocationModel;

  factory AddressFromLocationModel.fromJson(Map<String, dynamic> json) => _$AddressFromLocationModelFromJson(json);
}
