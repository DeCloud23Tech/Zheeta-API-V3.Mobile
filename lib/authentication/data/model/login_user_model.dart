import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

part 'login_user_model.freezed.dart';
part 'login_user_model.g.dart';

@freezed
class LoginUserModel with _$LoginUserModel {
  @JsonSerializable()
  factory LoginUserModel({
    dynamic token,
    dynamic refreshToken,
    dynamic username,
  }) = _LoginUserModel;

  factory LoginUserModel.fromJson(MappedResponse json) =>
      _$LoginUserModelFromJson(json);
}
