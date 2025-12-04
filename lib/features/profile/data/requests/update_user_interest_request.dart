import 'package:json_annotation/json_annotation.dart';

part 'update_user_interest_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateUserInterestRequest {
  String userId;
  List<int> interestIds;

  UpdateUserInterestRequest({required this.userId, required this.interestIds});

  factory UpdateUserInterestRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserInterestRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserInterestRequestToJson(this);
}
