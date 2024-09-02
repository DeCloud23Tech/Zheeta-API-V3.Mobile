import 'package:json_annotation/json_annotation.dart';

part 'update_user_interest_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateUserUnterestRequest {
  String userId;
  List<int> interestIds;

  UpdateUserUnterestRequest({required this.userId, required this.interestIds});

  factory UpdateUserUnterestRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserUnterestRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserUnterestRequestToJson(this);
}
