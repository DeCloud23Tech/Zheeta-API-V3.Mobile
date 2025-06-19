import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/mixins/location_helper.dart';
import 'package:zheeta/features/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/utils/format_utils.dart';
import 'package:zheeta/utils/token_utils.dart';

part 'profile_create_state.dart';

@prod
@LazySingleton()
class ProfileCreateCubit extends Cubit<ProfileCreateState>
    with LocationHelperMixin {
  final CreateProfile createProfile;
  final UpdateUserProfilePicture updateUserProfilePicture;
  final UpdateUserProfileCarousels userProfileCarousels;
  final ProfileInterestCubit profileInterestCubit;

  ProfileCreateCubit({
    required this.createProfile,
    required this.userProfileCarousels,
    required this.updateUserProfilePicture,
    required this.profileInterestCubit,
  }) : super(ProfileCreateInitial());

  final Map<String, dynamic> _profileData = {};



  /// Updates profile bio data
  void updateProfileBioData({
    String? firstName,
    String? lastName,
    String? gender,
    String? dob,
  }) {
    _profileData.addAll({
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (gender != null) 'gender': gender,
      if (dob != null) 'dob': dob,
    });
    emit(ProfileCreateUpdated(_profileData));
  }

  /// Updates location data
  void updateProfileLocationData({
    String? address,
    String? city,
    String? state,
    String? country,
    String? postcode,
    double? longitude,
    double? latitude,
  }) {
    _profileData.addAll({
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (postcode != null) 'postcode': postcode,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
    });
    emit(ProfileCreateUpdated(_profileData));
  }

  Future<void> updateProfileAdditionalData({
    double? height,
    int? weight,
    String? bodyType,
    String? complexion,
    String? maritalStatus,
    String? religion,
    String? occupation,
    String? originCountry,
    String? originCity,
    String? language,
    String? tagline,
    String? bio,
    List<dynamic>? selectedInterestIds,
  }) async {
    _profileData.addAll({
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (bodyType != null) 'bodyType': bodyType,
      if (complexion != null) 'complexion': complexion,
      if (maritalStatus != null) 'maritalStatus': maritalStatus,
      if (religion != null) 'religion': religion,
      if (selectedInterestIds != null && selectedInterestIds.isNotEmpty)
        'selectedInterestIds': selectedInterestIds,
      if (originCountry != null) 'originCountry': originCountry,
      if (occupation != null) 'occupation': occupation,
      if (originCity != null) 'originCity': originCity,
      if (language != null) 'language': language,
      if (tagline != null) 'tagline': tagline,
      if (bio != null) 'bio': bio,
    });

    // print(_profileData);

    final userId = await TokenUtil.getUserId();

    final data = CreateUserProfileRequest(
      userId: userId!,
      firstName: _profileData['firstName'] ?? '',
      lastName: _profileData['lastName'] ?? '',
      dateOfBirth: _profileData['dob'] ?? '',
      gender: _profileData['gender'] == 'Male' ? 1 : 2,
      languageCSV: [_profileData['language'] ?? ''],
      aboutMe: _profileData['bio'] ?? '',
      bodyType: _profileData['bodyType'] ?? '',
      complexion: _profileData['complexion'] ?? '',
      height: _profileData['height'] ?? 0.0,
      occupation: _profileData['occupation'] ?? '',
      religion: _profileData['religion'] ?? '',
      weight: _profileData['weight'] ?? '',
      tagline: _profileData['tagline'] ?? '',
      city: _profileData['city'] ?? '',
      state: _profileData['state'] ?? '',
      country: _profileData['country'] ?? '',
      zipCode: _profileData['postcode'] ?? '',
      latitude: _profileData['latitude'],
      longitude: _profileData['longitude'],
      originCity: _profileData['originCity'] ?? '',
      originCountry: _profileData['originCountry'] ?? '',
      maritalStatus: getMaritalStatusCode(_profileData['maritalStatus']),
    );

    // You may choose not to emit this state again here
    // emit(ProfileCreateUpdated(_profileData)); // Optional depending on your flow
    createProfileCubit(data);
  }

  /// Returns the final profile data
  Map<String, dynamic> get profileData => _profileData;

  Future<void> createProfileCubit(CreateUserProfileRequest request) async {
    emit(ProfileCreateLoading());
    final userId = await TokenUtil.getUserId();
    var result = await createProfile(request);
    result.fold(
      (fail) {
        emit(ProfileCreateError(fail.message));
      },
      (success) async {
        if (_profileData['selectedInterestIds'] != null && userId != null) {
          final selectedInterestIds =
              (_profileData['selectedInterestIds'] as List<dynamic>)
                  .map<int>((e) => e as int)
                  .toList();
          profileInterestCubit.updateUserInterestCubit(
            request: UpdateUserInterestRequest(
              userId: userId,
              interestIds: selectedInterestIds,
            ),
          );
        }
        emit(ProfileCreateSuccess());
      },
    );
  }

  Future<void> createUserProfilePictureCubit(
      UploadProfilePictureParam request) async {
    emit(ProfileCreateLoading());
    var result = await updateUserProfilePicture(request);
    result.fold(
      (fail) {
        emit(ProfileCreateError(fail.message));
      },
      (success) {
        emit(ProfilePictureCreateSuccess());
      },
    );
  }

  Future<void> uploadProfileCarouselsCubit(
      UploadProfileCarouselsParam request) async {
    emit(ProfileCreateLoading());
    var result = await userProfileCarousels(request);
    result.fold(
      (fail) {
        emit(ProfileCreateError(fail.message));
      },
      (success) {
        emit(ProfileCarouselsCreateSuccess());
      },
    );
  }
}

