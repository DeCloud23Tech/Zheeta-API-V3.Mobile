import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_access_usecases.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_usecases.dart';

part 'profile_state.dart';

@prod
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final GetSingleUserProfile getSingleUserProfile;

  ProfileCubit({
    required this.getSingleUserProfile,
  }) : super(const ProfileInitialState());

  Future<UserProfileModel?> getSingleUserProfileCubit() async {
    // When transitioning to ProfileLoadingState, explicitly create a new instance
    // and pass the existing profile and blocked users data from the current state.
    emit(ProfileLoadingState(
      profile: state.profile, // Preserve current profile data
    ));

    UserProfileModel? userProfile;
    var result = await getSingleUserProfile();
    result.fold(
      (fail) {
        emit(ProfileErrorState(
          fail.message,
          profile: state.profile,
        ));
      },
      (success) {
        emit(ProfileLoadedState(
          profile: success,
        ));
        userProfile = success;
      },
    );
    return userProfile;
  }
}
