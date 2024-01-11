import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_by_customer_model.freezed.dart';
part 'search_user_by_customer_model.g.dart';

@freezed
class SearchUserByCustomerModel with _$SearchUserByCustomerModel {
  @JsonSerializable()
  const factory SearchUserByCustomerModel({
    dynamic profileDisplayURL,
    dynamic username,
    dynamic userId,
    dynamic isFullyVerified,
  }) = _SearchUserByCustomerModel;

  factory SearchUserByCustomerModel.fromJson(Map<String, dynamic> json) => _$SearchUserByCustomerModelFromJson(json);
}

@freezed
class SearchUserByCustomerListModel with _$SearchUserByCustomerListModel {
  @JsonSerializable(explicitToJson: true)
  const factory SearchUserByCustomerListModel({
    List<SearchUserByCustomerModel>? data,
  }) = _SearchUserByCustomerListModel;

  factory SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) => _$SearchUserByCustomerListModelFromJson(json);
}
