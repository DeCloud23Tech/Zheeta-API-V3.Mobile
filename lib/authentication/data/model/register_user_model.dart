import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

part 'register_user_model.freezed.dart';
part 'register_user_model.g.dart';

@freezed
class RegisterUserModel with _$RegisterUserModel {
  @JsonSerializable()
  factory RegisterUserModel({
    dynamic phoneCountryCode,
    dynamic rolesCSV,
    dynamic createdDate,
    dynamic lastSeenDate,
    dynamic isFullyVerified,
    dynamic isBlocked,
    dynamic authType,
    dynamic id,
    dynamic userName,
    dynamic normalizedUserName,
    dynamic email,
    dynamic normalizedEmail,
    dynamic emailConfirmed,
    dynamic passwordHash,
    dynamic securityStamp,
    dynamic concurrencyStamp,
    dynamic phoneNumber,
    dynamic phoneNumberConfirmed,
    dynamic twoFactorEnabled,
    dynamic lockoutEnd,
    dynamic lockoutEnabled,
    dynamic accessFailedCount,
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(MappedResponse json) => _$RegisterUserModelFromJson(json);
}
