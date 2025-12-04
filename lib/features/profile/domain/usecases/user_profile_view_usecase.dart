import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_repository.dart';

@prod
@LazySingleton()
class VisitUserProfile extends UsecaseWithParams<ViewProfileModel, String> {
  const VisitUserProfile(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<ViewProfileModel> call(String param) async =>
      await _repo.visitUserProfileRepo(userId: param);
}

// @prod
// @LazySingleton()
// class GetVisitedUserRecentActivity extends UsecaseWithParams<ActivityListModel,
//     GetVisitedUserRecentActivityParams> {
//   const GetVisitedUserRecentActivity(this._repo);
//
//   final UserProfileRepository _repo;
//
//   @override
//   ResultFuture<ActivityListModel> call(
//       GetVisitedUserRecentActivityParams param) async =>
//       await _repo.getVisitedUserRecentActivity(
//           userId: param.userId,
//           pageNumber: param.pageNo,
//           pageSize: param.pageSize);
// }

// class GetVisitedUserRecentActivityParams {
//   String userId;
//   int pageNo;
//   int pageSize;
//
//   GetVisitedUserRecentActivityParams(
//       {required this.userId, required this.pageNo, required this.pageSize});
// }
