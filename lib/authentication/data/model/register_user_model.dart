import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

part 'register_user_model.freezed.dart';
part 'register_user_model.g.dart';

@freezed
class RegisterUserModel with _$RegisterUserModel {
  @JsonSerializable()
  const factory RegisterUserModel({
    required dynamic phoneCountryCode,
    required dynamic rolesCSV,
    required dynamic createdDate,
    required dynamic lastSeenDate,
    required dynamic isFullyVerified,
    required dynamic isBlocked,
    required dynamic authType,
    required dynamic id,
    required dynamic userName,
    required dynamic normalizedUserName,
    required dynamic email,
    required dynamic normalizedEmail,
    required dynamic emailConfirmed,
    required dynamic passwordHash,
    required dynamic securityStamp,
    required dynamic concurrencyStamp,
    required dynamic phoneNumber,
    required dynamic phoneNumberConfirmed,
    required dynamic twoFactorEnabled,
    required dynamic lockoutEnd,
    required dynamic lockoutEnabled,
    required dynamic accessFailedCount,
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(MappedResponse json) => _$RegisterUserModelFromJson(json);
}
