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
    List<SearchUserByCustomerModel>? data,
  }) = _SearchUserByCustomerListModel;

  factory SearchUserByCustomerListModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerListModelFromJson(json);
}

@freezed
class SearchUserByCustomerModel with _$SearchUserByCustomerModel {
  factory SearchUserByCustomerModel({
    String? profileDisplayURL,
    String? username,
    String? userId,
    bool? isFullyVerified,
  }) = _SearchUserByCustomerModel;

  factory SearchUserByCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserByCustomerModelFromJson(json);
}
