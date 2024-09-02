import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_downline_model.freezed.dart';
part 'user_downline_model.g.dart';

@freezed
class UserDownlineModel with _$UserDownlineModel {
  const factory UserDownlineModel({
    required String id,
    required String firstName,
    required String lastName,
    required String userName,
    required String profilePhotoURL,
  }) = _UserDownlineModel;

  factory UserDownlineModel.fromJson(Map<String, dynamic> json) =>
      _$UserDownlineModelFromJson(json);
}
