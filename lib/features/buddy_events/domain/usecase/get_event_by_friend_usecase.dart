// import 'package:injectable/injectable.dart';
// import 'package:zheeta/common/constants/type_def.dart';
// import 'package:zheeta/common/param/pagination_param.dart';
// import 'package:zheeta/common/usecase/usecases.dart';
// import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';
//
//
// @prod
// @LazySingleton()
// class GetEventsCreatedByFriends
//     extends UsecaseWithParams<List<FriendCreatedBuddyEvent>, PaginationParam> {
//   const GetEventsCreatedByFriends(this._repo);
//
//   final EventRepository _repo;
//
//   @override
//   ResultFuture<List<FriendCreatedBuddyEvent>> call(
//           PaginationParam params) async =>
//       await _repo.getEventsCreatedByFriends(
//         pageNumber: params.pageNo,
//         pageSize: params.pageSize,
//       );
// }
