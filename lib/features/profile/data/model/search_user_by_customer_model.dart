import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_by_customer_model.freezed.dart';
part 'search_user_by_customer_model.g.dart';

@freezed
class SearchUserByCustomerListModel with _$SearchUserByCustomerListModel {
  factory SearchUserByCustomerListModel({
    int? statusCode,
    String? message,
    bool? success,
    int? totalCount,
    List<SearchUserByCustomer>? data,
  }) = _SearchUserByCustomerListModel;

  factory SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerListModelFromJson(json);
}

@freezed
class SearchUserByCustomer with _$SearchUserByCustomer {
  factory SearchUserByCustomer({
    String? profileDisplayURL,
    String? username,
    String? userId,
    bool? isFullyVerified,
  }) = _SearchUserByCustomer;

  factory SearchUserByCustomer.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerFromJson(json);
}
