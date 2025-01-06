import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/mixins/location_helper.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/utils/token_utils.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/model/blocked_user_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/model/user_post_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/location_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_interest_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_access_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart';

part 'profile_state.dart';

@prod
@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> with LocationHelperMixin {
  final GetAddressFromLocationCoordinate getAddressFromLocationCoordinate;
  final GetLocationCoordinateFromAddress getLocationCoordinateFromAddress;

  final GetInterests getInterests;
  final UpdateUserInterest updateUserInterest;
  final BlockAccount blockAccount;
  final GetBlockedUsers getBlockedUsers;
  final UnBlockAccount unBlockAccount;

  final CreateProfile createProfile;
  final GetAllUsersProfile getAllUsersProfile;
  final GetSingleUserProfile getSingleUserProfile;

  final GetUserRecentActivity getUserRecentActivity;
  final UpdateUserProfilePicture updateUserProfilePicture;
  final UpdateUserProfileCarousels userProfileCarousels;
  final UpdateUserProfile updateUserProfile;

  final SearchUserByCustomer searchUserByCustomer;

  ProfileCubit({

    required this.getAddressFromLocationCoordinate,
    required this.getLocationCoordinateFromAddress,

    required this.getInterests,
    required this.updateUserInterest,
    required this.blockAccount,
    required this.getBlockedUsers,
    required this.unBlockAccount,

    required this.createProfile,
    required this.getAllUsersProfile,
    required this.getSingleUserProfile,
    required this.getUserRecentActivity,
    required this.updateUserProfilePicture,
    required this.userProfileCarousels,
    required this.updateUserProfile,

    required this.searchUserByCustomer,
  }) : super(ProfileInitialState());

  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phoneNumber;
  String? bio;
  int? gender;
  String? dob;
  String? address;
  String? country;
  String? selectedState;
  String? city;
  String? postCode;
  double? height;
  double? weight;
  String? bodyType;
  int? maritalStatus;
  String? complexion;
  String? religion;
  List<int>? interests = [];
  String? occupation;
  String? languages;
  String? originCountry;
  String? originCity;
  String? about;
  String? tagline;

  void updateFirstName(String? firstName) => this.firstName = firstName;

  void updateLastName(String? lastName) => this.lastName = lastName;

  void updateUserName(String? userName) => this.userName = userName;

  void updateEmail(String? email) => this.email = email;

  void updatePhoneNumber(String? phoneNumber) => this.phoneNumber = phoneNumber;

  void updateBio(String? bio) => this.bio = bio;

  void updateGender(String? gender) {
    if (gender == 'Male') {
      this.gender = 1;
    } else if (gender == 'Female') {
      this.gender = 2;
    } else {
      this.gender = 3;
    }
  }

  void updateDOB(String? dob) => this.dob = dob;

  void updateAddress(String? address) => this.address = address;

  void updateCountry(String? country) => this.country = country;

  void updateState(String? selectedState) => this.selectedState = selectedState;

  void updateCity(String? city) => this.city = city;

  void updatePostCode(String? postCode) => this.postCode = postCode;

  void updateHeight(double? height) => this.height = height;

  void updateWeight(double? weight) => this.weight = weight;

  void updateBodyType(String? bodyType) => this.bodyType = bodyType;

  void updateMaritalStatus(String? maritalStatus) {
    if (maritalStatus == 'Single') {
      this.maritalStatus = 1;
    } else if (maritalStatus == 'Married') {
      this.maritalStatus = 2;
    } else if (maritalStatus == 'Divorced') {
      this.maritalStatus = 3;
    } else if (maritalStatus == 'Widowed') {
      this.maritalStatus = 4;
    } else if (maritalStatus == 'Separated') {
      this.maritalStatus = 5;
    } else {
      this.maritalStatus = 6;
    }
  }

  void updateComplexion(String? complexion) => this.complexion = complexion;

  void updateReligion(String? religion) => this.religion = religion;

  void updateInterests(List<dynamic>? interests) =>
      this.interests = interests?.cast<int>();

  void updateOccupation(String? occupation) => this.occupation = occupation;

  void updateLanguages(String? languages) => this.languages = languages;

  void updateOriginCountry(String? originCountry) =>
      this.originCountry = originCountry;

  void updateOriginCity(String? originCity) => this.originCity = originCity;

  void updateAbout(String? about) => this.about = about;

  void updateTagline(String? tagline) => this.tagline = tagline;

  Future<void> submitProfile() async {
    final _userId = await TokenUtil.getUserId();
    final locationResult = await getLocation();

    final data = CreateUserProfileRequest(
      userId: _userId!,
      firstName: firstName!,
      lastName: lastName!,
      dateOfBirth: dob!,
      gender: gender!,
      languageCSV: [languages!],
      aboutMe: about!,
      bodyType: bodyType!,
      complexion: complexion!,
      height: height!,
      occupation: occupation!,
      religion: religion!,
      weight: weight!,
      tagline: tagline!,
      city: city!,
      state: selectedState!,
      country: country!,
      zipCode: postCode!,
      latitude: locationResult!.latitude,
      longitude: locationResult.longitude,
      originCity: originCity!,
      originCountry: originCountry!,
      maritalStatus: maritalStatus!,
    );

    createProfileCubit(data);
  }

  Future<void> updateProfile() async {
    // Print all values before updating the profile
    print('First name: $firstName');
    print('Last name: $lastName');
    print('Username: $userName');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Bio: $bio');
    print('Origin City: $city');
    print('Origin Country: $country');
    print('Height: $height');
    print('Weight: $weight');
    print('Body Type: $bodyType');
    print('Complexion: $complexion');
    print('Religion: $religion');

    print('Interests: $interests');

    // Perform the profile update
    final _userId = await TokenUtil.getUserId();

    // final data = UpdateUserProfileRequest(
    //   userId: _userId!,
    //   firstName: firstName,
    //   lastName: lastName,
    //   userName: username,
    //   email: email,
    //   phoneNumber: phoneNumber,
    //   aboutMe: bio,
    //   originCity: originCity,
    //   originCountry: originCountry,
    //   height: height,
    //   weight: weight,
    //   bodyType: bodyType,
    //   complexion: complexion,
    //   religion: religion,
    // );

    // Call the update profile function in the cubit
    // updateProfileCubit(data);
  }

  Future<void> submitProfileBoost() async {
    final _userId = await TokenUtil.getUserId();
    print('Selected Country: $country');
    print('Selected Gender: $gender');
    print('Selected City: $city');
    // print('Selected Caption: $caption');
    // print('Min Age: $minAge');
    // print('Max Age: $maxAge');
    // print('Duration: $duration');
    // print('Manually Entered Number: $manuallyEnteredNumber');
    // print('Selected Media: ${selectedMedias} items');

    // final data = CreateProfileBoostRequest(
    //   userId: _userId!,
    //   targetCountry: selectedCountry,
    //   targetGender: selectedGender,
    //   targetCity: selectedCity,
    //   minAge: minAge,
    //   maxAge: maxAge,
    //   maritalStatus: maritalStatus!,
    //   targetUsersNumber: manuallyEnteredNumber,
    //   duration: duration,
    //   adsCost: calculatedCost.toDouble(),
    //   photoUrlForAds: selectedMedias
    //       .map((media) => media.carouselPhotoUrl as String)
    //       .toList(),
    //   caption: selectedCaption,
    // );
    //
    // createProfileCubit(data);
    print('Profile Boost Created Successfully!');

  }


  void resetState() {
    emit(ProfileInitialState());
  }

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
        emit(ProfileGotAddressLocationState(success));
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

  //Profile Bank Section

  //Profile Interests
  Future<void> getInterestsCubit() async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await getInterests();

    print(result);
    result.fold(
      (fail) {
        emit((state as ProfileCompositeState)
            .copyWith(errorMessage: fail.message));
      },
      (success) {
        print(success);
        emit((state as ProfileCompositeState).copyWith(userInterests: success));
      },
    );
  }

  Future<void> updateUserInterestCubit(
      {required UpdateUserInterestRequest request}) async {
    // emit(ProfileLoadingState());
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
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await blockAccount(BlockUserParams(
        userId: userId, blockOrUnblockUserId: blockOrUnBlockId));
    result.fold(
      (fail) {
        emit((state as ProfileCompositeState)
            .copyWith(errorMessage: fail.message));
      },
      (success) {
        emit((state as ProfileCompositeState)
            .copyWith(success: 'User blocked successfully'));
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
        emit((state as ProfileCompositeState)
            .copyWith(errorMessage: fail.message));
      },
      (success) {
        emit((state as ProfileCompositeState)
            .copyWith(success: 'User unblocked successfully'));
      },
    );
  }

  Future<void> getBlockedUsersCubit(PaginationParam request) async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await getBlockedUsers(request);
    print('getting blocked users');
    result.fold(
      (fail) {
        emit((state as ProfileCompositeState)
            .copyWith(errorMessage: fail.message));
      },
      (success) {
        emit((state as ProfileCompositeState)
            .copyWith(allBlockedUsers: success));
      },
    );
  }

  //Profile Block And UnBlock User Section Ends

  // Profile Boosts


  //Profile Boosts Ends

  //User Profile
  Future<void> createProfileCubit(CreateUserProfileRequest request) async {
    emit(ProfileLoadingState());
    var result = await createProfile(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) async {
        final _userId = await TokenUtil.getUserId();
        if (interests != null && _userId != null) {
          updateUserInterestCubit(
            request: UpdateUserInterestRequest(
              userId: _userId,
              interestIds: interests!,
            ),
          );
        }
        emit(ProfileCreatedState());
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
        userProfile = success;
      },
    );

    return userProfile;
  }




  Future<void> createUserProfilePictureCubit(
      UploadProfilePictureParam request) async {
    emit(ProfileLoadingState());
    var result = await updateUserProfilePicture(request);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        emit(ProfilePictureUploadedState());
      },
    );
  }

  Future<void> updateUserProfilePictureCubit(
      UploadProfilePictureParam request) async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await updateUserProfilePicture(request);
    result.fold(
      (fail) {
        emit((state as ProfileCompositeState)
            .copyWith(errorMessage: fail.message));
      },
      (success) {
        getSingleUserProfileCubit();
      },
    );
  }

  Future<void> uploadProfileCarouselsCubit(
      UploadProfileCarouselsParam request) async {
    emit(ProfileLoadingState());
    var result = await userProfileCarousels(request);
    print(result);
    result.fold(
      (fail) {
        emit(ProfileErrorState(fail.message));
      },
      (success) {
        // getSingleUserProfileCubit();
        // emit(ProfileCarouselsUploadedState());
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

  Future<void> searchUserByCustomerCubit(UserSearchByEmailParam request) async {
    emit(ProfileLoadingCompositeState(
        userProfile: (state as ProfileCompositeState).userProfile));
    var result = await searchUserByCustomer(request);

    result.fold(
      (fail) {
        // Emit an error state with the error message
        emit((state as ProfileCompositeState).copyWith(
          errorMessage: fail.message,
        ));
      },
      (success) {
        // Update the composite state with the search results
        emit((state as ProfileCompositeState).copyWith(
          searchedUsers: success.data, // Update searched users
          errorMessage: null,
        ));
      },
    );
  }


}
