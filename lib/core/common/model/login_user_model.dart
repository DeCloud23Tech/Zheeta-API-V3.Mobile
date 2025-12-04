import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/core/constants/type_def.dart';

part 'login_user_model.freezed.dart';
part 'login_user_model.g.dart';

@freezed
abstract class LoginUserModel with _$LoginUserModel {
  factory LoginUserModel({
    dynamic token,
    dynamic refreshToken,
    dynamic username,
  }) = _LoginUserModel;

  factory LoginUserModel.fromJson(MappedResponse json) =>
      _$LoginUserModelFromJson(json);
}
