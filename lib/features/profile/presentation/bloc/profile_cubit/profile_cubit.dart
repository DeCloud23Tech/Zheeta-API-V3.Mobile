import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/features/profile/data/model/blocked_user_model.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_access_usecases.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';

part 'profile_state.dart';

@prod
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final GetSingleUserProfile getSingleUserProfile;
  final GetBlockedUsers getBlockedUsers;
  final BlockAccount blockAccount;
  final UnBlockAccount unBlockAccount;


  ProfileCubit({
    required this.getSingleUserProfile,
    required this.getBlockedUsers,
    required this.blockAccount,
    required this.unBlockAccount,
  }) : super(ProfileInitialState());

  Future<UserProfileModel?> getSingleUserProfileCubit() async {
    emit(ProfileLoadingState(
        profile: state.profile, allBlockedUsers: state.allBlockedUsers));
    UserProfileModel? userProfile;
    var result = await getSingleUserProfile();
    result.fold(
      (fail) {
        emit(ProfileErrorState(
          fail.message,
          profile: state.profile,
          allBlockedUsers: state.allBlockedUsers,
        ));
      },
      (success) {
        emit(ProfileLoadedState(
          profile: success,
          allBlockedUsers: state.allBlockedUsers,
        ));
        userProfile = success;
      },
    );
    return userProfile;
  }

  /// Fetch blocked users with pagination
  Future<void> getBlockedUsersCubit(PaginationParam request) async {
    emit(ProfileLoadingState(
        profile: state.profile, allBlockedUsers: state.allBlockedUsers));
    final result = await getBlockedUsers(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(
          fail.message,
          profile: state.profile,
          allBlockedUsers: state.allBlockedUsers,
        ));
      },
      (success) {
        emit(ProfileLoadedState(
            profile: state.profile, allBlockedUsers: success));
      },
    );
  }

  /// Block user
  Future<void> blockAccountCubit({
    required String blockOrUnBlockId,
    required String userId,
  }) async {
    emit(ProfileBlockLoadingState(
        profile: state.profile, allBlockedUsers: state.allBlockedUsers));
    final result = await blockAccount(BlockUserParams(
      userId: userId,
      blockOrUnblockUserId: blockOrUnBlockId,
    ));
    result.fold(
      (fail) {
        emit(ProfileErrorState(
          fail.message,
          profile: state.profile,
          allBlockedUsers: state.allBlockedUsers,
        ));
      },
      (success) {
        emit(ProfileLoadedState(
            profile: state.profile, allBlockedUsers: state.allBlockedUsers));
      },
    );
  }

  /// Unblock user
  Future<void> unBlockAccountCubit({
    required String blockOrUnBlockId,
    required String userId,
  }) async {
    emit(ProfileBlockLoadingState(
        profile: state.profile, allBlockedUsers: state.allBlockedUsers));
    final result = await unBlockAccount(BlockUserParams(
      userId: userId,
      blockOrUnblockUserId: blockOrUnBlockId,
    ));
    result.fold(
      (fail) {
        emit(ProfileErrorState(
          fail.message,
          profile: state.profile,
          allBlockedUsers: state.allBlockedUsers,
        ));
      },
      (success) {
        emit(ProfileLoadedState(
            profile: state.profile, allBlockedUsers: state.allBlockedUsers));
      },
    );
  }
}
