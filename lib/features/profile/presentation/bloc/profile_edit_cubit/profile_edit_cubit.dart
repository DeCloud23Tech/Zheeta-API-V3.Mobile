import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';

part 'profile_edit_state.dart';

@prod
@LazySingleton()
class ProfileEditCubit extends Cubit<ProfileEditState> {
  final UpdateUserProfileCarousels userProfileCarousels;
  final UpdateUserProfilePicture updateUserProfilePicture;
  final UpdateUserProfile updateUserProfile;

  ProfileEditCubit({
    required this.userProfileCarousels,
    required this.updateUserProfile,
    required this.updateUserProfilePicture,
  }) : super(ProfileEditInitial());

  Future<void> updateUserProfilePictureCubit(
      UploadProfilePictureParam request) async {
    emit(ProfileUpdateLoading());
    var result = await updateUserProfilePicture(request);
    result.fold(
      (fail) {
        emit(ProfileUpdateError(fail.message));
      },
      (success) {
        emit(ProfilePictureUpdateSuccess());
      },
    );
  }

  Future<void> uploadProfileCarouselsCubit(
      UploadProfileCarouselsParam request) async {
    emit(ProfileUpdateLoading());
    var result = await userProfileCarousels(request);
    result.fold(
      (fail) {
        emit(ProfileUpdateError(fail.message));
      },
      (success) {
        emit(ProfileCarouselsUpdateSuccess());
      },
    );
  }

  Future<void> updateUserProfileCubit(UpdateUserProfileRequest request) async {
    emit(ProfileUpdateLoading());
    var result = await updateUserProfile(request);
    print(result);
    result.fold(
      (fail) {
        emit(ProfileUpdateError(fail.message));
      },
      (success) {
        emit(ProfileUpdateSuccess());
      },
    );
  }
}
