import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';

part 'profile_state.dart';

@prod
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final GetSingleUserProfile getSingleUserProfile;

  ProfileCubit({
    required this.getSingleUserProfile,
  }) : super(ProfileInitialState());

  Future<UserProfileModel?> getSingleUserProfileCubit() async {
    emit(ProfileLoadingState());
    UserProfileModel? userProfile;
    var result = await getSingleUserProfile();
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        emit(ProfileLoadedState(profile: success));
        userProfile = success;
      },
    );

    return userProfile;
  }
}
