import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

part 'search_user_by_admin_model.freezed.dart';
part 'search_user_by_admin_model.g.dart';

@freezed
class SearchUserByAdminListModel with _$SearchUserByAdminListModel {
  @JsonSerializable(explicitToJson: true)
  const factory SearchUserByAdminListModel({
    List<SearchUserByAdminModel>? data,
  }) = _SearchUserByAdminListModel;

  factory SearchUserByAdminListModel.fromJson(Map<String, dynamic> json) => _$SearchUserByAdminListModelFromJson(json);
}
