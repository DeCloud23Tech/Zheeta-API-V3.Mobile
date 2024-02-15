import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';

part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState({
    required State<UserProfileModel> getSingleUserProfileState,
    required State updateUserProfilePictureState,
    required State<AllUserProfileListModel> getAllUsersProfileState,
    required State createUserProfileState,
    required State updateUserProfileState,
    required State visitUserProfileState,
    required State<List<String>> countryState,
    required State<List<String>> cityState,
    required State<String?> selectedCityState,
    required State<String?> selectedCountryState,
  }) = _UserProfileState;

  UserProfileState._();

  UserProfileState setGetSingleUserProfileState(
          State<UserProfileModel> state) =>
      copyWith(getSingleUserProfileState: state);
  UserProfileState setUpdateUserProfilePictureState(State state) =>
      copyWith(updateUserProfilePictureState: state);
  UserProfileState setGetAllUsersProfileState(
          State<AllUserProfileListModel> state) =>
      copyWith(getAllUsersProfileState: state);
  UserProfileState setCreateUserProfileState(State state) =>
      copyWith(createUserProfileState: state);
  UserProfileState setUpdateUserProfileState(State state) =>
      copyWith(updateUserProfileState: state);
  UserProfileState setVisitUserProfileState(State state) =>
      copyWith(visitUserProfileState: state);

  UserProfileState setCountryState(State<List<String>> state) =>
      copyWith(countryState: state);
  UserProfileState setCityState(State<List<String>> state) =>
      copyWith(cityState: state);

  UserProfileState setSelectedCountryState(String? country) =>
      copyWith(selectedCountryState: State.success(country));
  UserProfileState setSelectedCityState(String? city) =>
      copyWith(selectedCityState: State.success(city));
}
