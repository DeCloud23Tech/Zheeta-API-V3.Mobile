import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/access_restriction_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_bank_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_boost_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_transaction_usecases.dart';

import '../../../../app/common/param/blocked_users_param.dart';
import '../../../../app/common/param/pagination_param.dart';
import '../../../../app/router/app_router.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../data/model/blocked_user_model.dart';
import '../../../data/model/total_matched_count_model.dart';

part 'profile_state.dart';

@prod
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final DisableAccount disableAccount;
  final EnableAccount enableAccount;
  final GetAddressFromLocationCoordinate getAddressFromLocationCoordinate;
  final GetLocationCoordinateFromAddress getLocationCoordinateFromAddress;
  final CreateUpdateBankAccount createUpdateBankAccount;
  final GetUserBankAccount getUserBankAccount;
  final GetInterests getInterests;
  final UpdateUserInterest updateUserInterest;
  final BlockAccount blockAccount;
  final GetBlockedUsers getBlockedUsers;
  final UnBlockAccount unBlockAccount;
  final CreateProfileBoost createProfileBoost;
  final GetTotalMatchCount getTotalMatchCount;
  final GetBoostedProfileByAdmin getBoostedProfileByAdmin;
  final CreateProfile createProfile;
  final GetAllUsersProfile getAllUsersProfile;
  final GetSingleUserProfile getSingleUserProfile;
  final GetUserRecentActivity getUserRecentActivity;
  final UpdateUserProfilePicture updateUserProfilePicture;
  final UpdateUserProfile updateUserProfile;
  final FindUserByAdminEmail findUserByAdminEmail;
  final FindUserByAdminUsername findUserByAdminUsername;
  final SearchUserByCustomer searchUserByCustomer;
  final GetUserTransactions getUserTransactions;


  ProfileCubit({
    required this.disableAccount,
    required this.enableAccount,
    required this.getAddressFromLocationCoordinate,
    required this.getLocationCoordinateFromAddress,
    required this.createUpdateBankAccount,
    required this.getUserBankAccount,
    required this.getInterests,
    required this.updateUserInterest,
    required this.blockAccount,
    required this.getBlockedUsers,
    required this.unBlockAccount,
    required this.createProfileBoost,
    required this.getBoostedProfileByAdmin,
    required this.getTotalMatchCount,
    required this.createProfile,
    required this.getAllUsersProfile,
    required this.getSingleUserProfile,
    required this.getUserRecentActivity,
    required this.updateUserProfilePicture,
    required this.updateUserProfile,
    required this.findUserByAdminEmail,
    required this.findUserByAdminUsername,
    required this.searchUserByCustomer,
    required this.getUserTransactions,
  }) : super(ProfileInitialState());

  void resetState() {
    emit(ProfileInitialState());
  }


  //Enable and Disable Account
  Future<void> enableAccountCubit({required String userId}) async {
    emit(ProfileLoadingState());
    var result = await enableAccount(userId);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileEnabledUserState());
      },
    );
  }

  Future<void> disableAccountCubit({required String userId}) async {
    emit(ProfileLoadingState());
    var result = await disableAccount(userId);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileDisabledUserState());
      },
    );
  }

  //Enable and Disable Account End

  //Profile Location Section
  Future<AddressFromLocationModel?> getAddressFromLocationCoordinateCubit(
      {required double longitude, required double latitude}) async {
    emit(ProfileLoadingState());

    AddressFromLocationModel? data;
    var result = await getAddressFromLocationCoordinate(
        GetAddressParameter(latitude: latitude, longitude: longitude));
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotAddressLocationState(success));
        data = success;
      },
    );

    return data;
  }

  Future<void> getLocationCoordinateFromAddressCubit(
      {required LocationCoordinateFromAddressRequest request}) async {
    emit(ProfileLoadingState());
    var result = await getLocationCoordinateFromAddress(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotLocationCoordinateState());
      },
    );
  }

  //Profile Location Section End

  //Profile Bank Section
  Future<void> createUpdateBankAccountCubit(
      {required CreateUpdateBankAccountRequest request}) async {
    emit(ProfileLoadingState());
    var result = await createUpdateBankAccount(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileCreatedBankAccountState());
      },
    );
  }

  Future<void> getUserBankAccountCubit() async {
    emit(ProfileLoadingState());
    var result = await getUserBankAccount();
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotBankAccountState(success));
      },
    );
  }

  //Profile Bank Section

  //Profile Interests
  Future<UserInterestListModel?> getInterestsCubit() async {
    UserInterestListModel? data;
    emit(ProfileLoadingState());
    var result = await getInterests();
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotUserInterests(success));
        data = success;
      },
    );
    return data;
  }

  Future<void> updateUserInterestCubit(
      {required UpdateUserUnterestRequest request}) async {
    emit(ProfileLoadingState());
    var result = await updateUserInterest(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileUpdatedInterestState());
      },
    );
  }

  //Profile Interests Ends

  //Profile Block And UnBlock User Section
  Future<void> blockAccountCubit(
      {required String blockOrUnBlockId, required String userId}) async {
    // emit(ProfileLoadingCompositeState());
    var result = await blockAccount(BlockUserParams(
        userId: userId, blockOrUnblockUserId: blockOrUnBlockId));
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit((state as ProfileCompositeState)
        //     .copyWith(success: 'User blocked successfully'));
      },
    );
  }

  Future<void> unBlockAccountCubit({
    required String blockOrUnBlockId,
    required String userId,
  }) async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await unBlockAccount(BlockUserParams(
        userId: userId, blockOrUnblockUserId: blockOrUnBlockId));

    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) async {
        getBlockedUsersCubit(PaginationParam(pageNo: 1, pageSize: 10)); // Fet
      },
    );
  }

  Future<void> getBlockedUsersCubit(PaginationParam request) async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await getBlockedUsers(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        emit((state as ProfileCompositeState)
            .copyWith(allBlockedUsers: success));
      },
    );
  }

  //Profile Block And UnBlock User Section Ends

  // Profile Boosts
  Future<void> createProfileBoostCubit(
      CreateProfileBoostRequest request) async {
    emit(ProfileLoadingState());
    var result = await createProfileBoost(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileCreatedProfileBoostState());
      },
    );
  }

  Future<void> getBoostedProfileByAdminCubit(
      CreateProfileBoostRequest request) async {
    emit(ProfileLoadingState());
    var result = await getBoostedProfileByAdmin(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotBoostedProfileAdminUsersState(success));
      },
    );
  }

  Future<GetTotalMatchedCountResponse?> getTotalMatchCountCubit() async {
    GetTotalMatchedCountResponse? data;
    emit(ProfileLoadingState());
    var result = await getTotalMatchCount();
    print(result);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotTotalMatchedCountState(success));
        data = success;
      },
    );
    return data;
  }

  //Profile Boosts Ends

  //User Profile
  Future<void> createProfileCubit(CreateUserProfileRequest request) async {
    emit(ProfileLoadingState());
    var result = await createProfile(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileCreatedState());
      },
    );
  }

  Future<void> getAllUsersProfileCubit(
      {int pageSize = 10, int pageNo = 1, int roleType = 1}) async {
    emit(ProfileLoadingState());
    var result = await getAllUsersProfile(GetAllUserParams(
        pageNo: pageNo, pageSize: pageSize, roleType: roleType));
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotAllUserState(success));
      },
    );
  }

  Future<UserProfileModel?> getSingleUserProfileCubit() async {
    emit(ProfileLoadingState());
    UserProfileModel? userProfile;
    var result = await getSingleUserProfile();
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        emit(ProfileCompositeState(userProfile: success));
        getUserRecentActivityCubit(currentPage: 1);
        userProfile = success;
      },
    );

    return userProfile;
  }



  Future<void> getUserRecentActivityCubit({required int currentPage,  int? pageSize = 5}) async {
    final currentState = state;

    if (currentState is ProfileCompositeState) {
      if (currentState.isFetching || currentState.hasReachedMax) {
        print('Request already in progress or max pages reached.');
        return;
      }

      emit(currentState.copyWith(isFetching: true));

      try {
        List<ActivityModel> recentActivities;

        if (currentPage == 1) {
          print('Fetching initial page: $currentPage');
          recentActivities = await _fetchUserRecentActivity(currentPage, pageSize!);
          emit(
            currentState.copyWith(
              recentActivities: ActivityListModel(data: recentActivities),
              currentPage: currentPage + 1,
              isFetching: false,
              hasReachedMax: recentActivities.isEmpty,
            ),
          );
        } else {
          print('Fetching next page: ${currentState.currentPage}');
          recentActivities = await _fetchUserRecentActivity(currentState.currentPage, pageSize!);
          emit(
            recentActivities.isEmpty
                ? currentState.copyWith(hasReachedMax: true, isFetching: false)
                : currentState.copyWith(
              recentActivities: ActivityListModel(
                data: List.of(currentState.recentActivities?.data ?? [])..addAll(recentActivities),
              ),
              currentPage: currentState.currentPage + 1,
              isFetching: false,
              hasReachedMax: recentActivities.isEmpty,
            ),
          );
        }
      } catch (e) {
        print('Error fetching activities: $e');
        emit(ProfileErrorState(e.toString()));
      }
    } else {
      print('Invalid state: $currentState');
    }
  }

  Future<List<ActivityModel>> _fetchUserRecentActivity(int pageNo, int pageSize) async {
    print('Fetching activities for page number: $pageNo');
    var result = await getUserRecentActivity(
      GetUserRecentActivityParams(pageNo: pageNo, pageSize: pageSize),
    );
    return result.fold(
          (fail) => throw Exception('Error fetching recent activities'),
          (success) => success.data ?? [],
    );
  }



  Future<void> updateUserProfilePictureCubit(
      UploadProfilePictureParam request) async {
    emit(ProfileLoadingState());
    var result = await updateUserProfilePicture(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfilePictureUploadedState());
      },
    );
  }

  Future<void> updateUserProfileCubit(UpdateUserProfileRequest request) async {
    emit(ProfileLoadingState());
    var result = await updateUserProfile(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileUpdatedState());
      },
    );
  }

  //User Profile Ends

  //Profile Search

  Future<void> findUserByAdminEmailCubit(UserSearchByEmailParam request) async {
    emit(ProfileLoadingState());
    var result = await findUserByAdminEmail(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileSearchedUserByAdminEmailState(success));
      },
    );
  }

  Future<void> findUserByAdminUsernameCubit(
      UserSearchByEmailParam request) async {
    emit(ProfileLoadingState());
    var result = await findUserByAdminUsername(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileSearchedUserByAdminUsernameState(success));
      },
    );
  }

  Future<void> searchUserByCustomerCubit(UserSearchByEmailParam request) async {
    emit(ProfileLoadingState());
    var result = await searchUserByCustomer(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileSearchedUserByCustomerState(success));
      },
    );
  }

  //Profile Search Ends

  // Profile Transaction
  Future<void> getUserTransactionsCubit(UserSearchByEmailParam request) async {
    emit(ProfileLoadingState());
    var result = await getUserTransactions(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // emit(ProfileGotUserTransactionsState(success));
      },
    );
  }
//Profile Transaction Ends
}
