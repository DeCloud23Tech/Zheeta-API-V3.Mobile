import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/buddy_events/data/datasource/event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_send_message_request.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_message_repository.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_verification_repository.dart';

abstract class EventMemberDataSource {
  Future<void> sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  });

  Future<List<BuddyEventJoinRequest>> getJoinRequests({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void>  processJoinRequest(ProcessJoinRequest request);

  Future<List<BuddyEventMember>> getBuddyEventMembers({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void>  removeBuddyEventMember({
    required String eventId,
    required String memberId,
  });
}
