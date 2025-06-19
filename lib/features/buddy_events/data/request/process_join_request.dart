import 'package:json_annotation/json_annotation.dart';

part 'process_join_request.g.dart';

@JsonSerializable()
class ProcessJoinRequest {
  final String eventId;
  final String requestId;
  final String requesterId;
  final bool isAccepted;

  ProcessJoinRequest({
    required this.eventId,
    required this.requestId,
    required this.requesterId,
    required this.isAccepted,
  });

  factory ProcessJoinRequest.fromJson(Map<String, dynamic> json) => _$ProcessJoinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessJoinRequestToJson(this);
}

