// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:zheeta/activity/data/models/activity_model.dart';
// import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
// import 'package:zheeta/profile/data/model/user_profile_model.dart';
// import 'package:zheeta/profile/data/model/view_profile_model.dart';
// import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
// import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
// import 'package:zheeta/profile/domain/repository/user_profile_repository.dart';
// import 'package:zheeta/profile/domain/usecase/user_profile_usecase.dart';

// @prod
// @LazySingleton(as: UserProfileUseCase)
// class UserProfileUseCaseImpl implements UserProfileUseCase {
//   final UserProfileRepository _repository;
//   UserProfileUseCaseImpl(this._repository);

//   @override
//   createUserProfileUseCase(CreateUserProfileRequest request) {
//     return _repository.createUserProfileRepo(request);
//   }

//   @override
//   Future<AllUserProfileListModel> getAllUsersProfileUseCase(
//       {required int roleType, required int pageNumber, required int pageSize}) {
//     return _repository.getAllUsersProfileRepo(
//       roleType: roleType,
//       pageNumber: pageNumber,
//       pageSize: pageSize,
//     );
//   }

//   @override
//   Future<UserProfileModel> getSingleUserProfileUseCase() {
//     return _repository.getSingleUserProfileRepo();
//   }

//   @override
//   updateUserProfilePictureUseCase(
//       {required String userId, required MultipartFile file}) {
//     return _repository.updateUserProfilePictureRepo(userId: userId, file: file);
//   }

//   @override
//   updateUserProfileUseCase(UpdateUserProfileRequest request) {
//     return _repository.updateUserProfileRepo(request);
//   }

//   @override
//   Future<ViewProfileModel> visitUserProfileUseCase({required String userId}) {
//     return _repository.visitUserProfileRepo(userId: userId);
//   }

//   @override
//   Future<ActivityListModel> getUserRecentActivity() {
//     return _repository.getUserRecentActivity();
//   }
// }
