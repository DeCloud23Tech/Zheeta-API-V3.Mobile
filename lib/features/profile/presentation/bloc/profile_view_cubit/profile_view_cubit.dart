import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_view_usecase.dart';

part 'profile_view_state.dart';

@prod
@LazySingleton()
class ProfileViewCubit extends Cubit<ProfileViewState> {
  final VisitUserProfile visitUserProfile;

  // final GetUserRecentActivity getUserRecentActivity;

  ProfileViewCubit({
    required this.visitUserProfile,
    // required this.getUserRecentActivity,
  }) : super(ProfileViewInitial());

  Future<ViewProfileModel?> visitUserProfileCubit(String userId) async {
    emit(ProfileViewLoading(profileData: state.profileData));
    ViewProfileModel? userProfile;
    var result = await visitUserProfile(userId);
    result.fold(
      (fail) {
        emit(ProfileViewErrorState(
          fail.message,
          profileData: state.profileData,
        ));
      },
      (success) {
        emit(ProfileViewLoadedState(
          profileData: success,
        ));
        userProfile = success;
      },
    );
    return userProfile;
  }

// Future<void> getUserRecentActivityCubit(PaginationParam request) async {
//   // emit(ProfileViewLoadingCompositeState(
//   //     profileData: (state as ProfileViewCompositeState).profileData));
//   // var result = await getUserRecentActivity(request);
//   // result.fold(
//   //   (fail) {
//   //     emit(ProfileViewError(fail.message));
//   //   },
//   //   (success) {
//   //     emit((state as ProfileViewCompositeState)
//   //         .copyWith(recentActivities: success));
//   //   },
//   // );
// }
}
