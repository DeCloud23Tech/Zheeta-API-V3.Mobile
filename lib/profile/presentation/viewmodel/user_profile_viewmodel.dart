import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' show MultipartFile;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/location_helper.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';
import 'package:zheeta/profile/data/model/address_from_location_model.dart';
import 'package:zheeta/profile/data/model/country_states_model.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../app/common/storage/local_storage_impl.dart';
import '../../../app/common/storage/storage_keys.dart';
import '../../data/request/create_profile_boost_request.dart';

@prod
@LazySingleton()
class UserProfileViewModel with ValidationHelperMixin, LocationHelperMixin {
  UserProfileViewModel();

  final List<String> bodyTypeList = AppLists.bodyTypes;
  final List<String> complexionList = AppLists.complexions;
  final List<String> religionList = AppLists.religions;
  final List<String> interestList = AppLists.interests;
  final List<String> occupationList = AppLists.occupations..sort();
  final List<String> languageList = AppLists.languages..sort();

  UserInterestListModel? interestsList;

  AddressFromLocationModel? addressFromLocation;

  ViewProfileModel? visitProfilePage;
  UserProfileModel? userProfileModel;
  ActivityListModel? userActivityModel;

  List<String> allStates = [];
  List<String> allCountries = [];

  String? userId;

  String _firstName = '';
  String _lastName = '';
  int _gender = -1;
  String _dob = '';

  String _address = '';
  String _city = '';
  String _postcode = '';

  double _height = 0;
  double _weight = 0;

  String _bodyType = '';
  String _complexion = '';
  String _religion = '';
  List<String> _languages = [];
  String _occupation = '';
  String _aboutMe = '';
  String _tagline = '';

  String _state = '';
  String _country = '';

  File? _profilePicture;

  double? _latitude;
  double? _longitude;

  List<int> _interest = [];

  int? matchedProfileBoostCount;

  setInterest(int value) {
    if (_interest.contains(value)) {
      _interest.remove(value);
    } else {
      _interest.add(value);
    }
  }

  String? validateInterest() =>
      _interest.isEmpty ? 'Please select at least one interest' : null;

  setFirstName(String value) => _firstName = value;

  setLastName(String value) => _lastName = value;

  setGender(String value) {
    switch (value.toLowerCase()) {
      case 'male':
        _gender = 1;
        break;
      case 'female':
        _gender = 2;
        break;
      default:
        _gender = 0;
    }
  }

  set setDob(DateTime? value) {
    if (value == null) {
      NotifyUser.showSnackbar('Select Date of Birth');
    } else {
      final date = DateFormat('yyyy-MM-dd').format(value);
      _dob = date;
    }
  }

  get getDob => _dob;

  setAddress(String value) => _address = value;

  setCity(String value) => _city = value;

  setPostcode(String value) => _postcode = value;

  setState(String? value) {
    _state = value ?? '';
  }

  setCountry(String? value) {
    _country = value ?? '';
  }

  setHeight(double value) => _height = value;

  setWeight(double value) => _weight = value;

  setBodyType(String value) => _bodyType = value;

  setComplexion(String value) => _complexion = value;

  setReligion(String value) => _religion = value;

  setLanguage(List<String> value) => _languages = value;

  setOccupation(String value) => _occupation = value;

  setAbout(String value) => _aboutMe = value;

  setTagline(String value) => _tagline = value;

  setProfilePicture(File file) => _profilePicture = file;

  String? validateFirstName() => this.isValidInput(_firstName);

  String? validateLastName() => this.isValidInput(_lastName);

  bool isValidGender() {
    if (_gender != -1) {
      return true;
    } else {
      NotifyUser.showSnackbar('Select your gender');
      return false;
    }
  }

  bool _isValidLatLong() {
    if (_latitude != null && _longitude != null) {
      return true;
    }
    return false;
  }

  String? validateDob() => this.isValidInput(_dob);

  String? validateAddress() => this.isValidInput(_address);

  String? validateCity() => this.isValidInput(_city);

  String? validatePostcode() => this.isValidInput(_postcode);

  String? validateState() => this.isValidInput(_state);

  String? validateCountry() => this.isValidInput(_country);

  String? validateOccupation() => this.isValidInput(_occupation);

  String? validateAboutMe() => this.isValidInput(_aboutMe);

  String? validateLanguage() => this.isValidInput(_languages.join(', '));

  String? validateTagline() => this.isValidInput(_tagline);

  String? validateLetsKnowYouForm() {
    if (_height == 0) {
      return 'Please choose your height';
    } else if (_weight == 0) {
      return 'Please choose your weight';
    } else if (_bodyType.isEmpty) {
      return 'Select your body type';
    } else if (_complexion.isEmpty) {
      return 'Select your complexion';
    } else if (_religion.isEmpty) {
      return 'Select your religion';
    } else if (_occupation.isEmpty) {
      return 'Select your occupation';
    } else if (_languages.isEmpty) {
      return 'Select your language';
    } else if (_aboutMe.isEmpty) {
      return 'Write something about yourself';
    } else if (_tagline.isEmpty) {
      return 'Please enter your tagline';
    } else {
      return null;
    }
  }

  void getUserId() async {
    userId = (await sessionManager.get(SessionManagerKeys.authUserIdString))
        as String;
  }

  String? validateProfilePicture() {
    if (_profilePicture == null) {
      return 'Please select your profile picture';
    } else {
      return null;
    }
  }

  loadCountry() async {
    allStates = [];
    allCountries = [];
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    allCountries = jsonData.keys.toSet().toList();
  }

  loadSelectedCountryStates(String country, {bool clearState = true}) async {
    if (clearState) setState(null);
    allStates = [];
    final data =
        await rootBundle.loadString('assets/json/countries_states.json');
    final jsonData = jsonDecode(data) as List<dynamic>;
    print(jsonData);
    var listOfCountriesWithState = jsonData
        .map((countryState) => CountryState.fromJson(countryState))
        .toList();
    if (listOfCountriesWithState != null) {
      var theCountry = listOfCountriesWithState
          .firstWhere((element) => element.name == country);
      var states =
          theCountry.states!.map((e) => e.name.toString()).toSet().toList();
      allStates = states;
      setState(states[0]);
    }
  }

  // loadCity(String country, {bool clearCity = true}) async {
  //   if (clearCity) setState(null);
  //   state = state.setCityState(State.success([]));
  //   final data = await rootBundle.loadString('assets/json/countries.json');
  //   final jsonData = jsonDecode(data) as Map<String, dynamic>;
  //   List<dynamic> city = jsonData.entries
  //       .firstWhere(
  //         (element) => element.key.toLowerCase() == country.toLowerCase(),
  //       )
  //       .value;
  //   state = state.setCityState(
  //     State.success(
  //       city.map((e) => e.toString()).toSet().toList(),
  //     ),
  //   );
  // }

  Future<bool> getInterests(BuildContext context) async {
    final result = await context.read<ProfileCubit>().getInterestsCubit();

    if (result != null) {
      interestsList = result;
      return true;
    } else {
      return false;
    }
  }

  Future<void> getSingleUserProfile(BuildContext context) async {
    final result =
        await context.read<ProfileCubit>().getSingleUserProfileCubit();
    userProfileModel = result;
    if (result == null) {
      router.push(BioDataRoute());
    } else if (result.data.profile?.profilePhotoURL == null) {
      router.push(ProfilePhotoRoute(username: result.data.user!.userName));
    } else {
      var matchesViewModel = locator<MatchCriteriaViewModel>();
      await matchesViewModel.populateMatches(context);
      await matchesViewModel.getMatches(context);
      // Save user ID to session
      sessionManager.set(
          SessionManagerKeys.authUserIdString, result.data.user?.userId);
      // router.popUntil((route) => route.isFirst);
      // router.replace(HomeRoute());
    }
    //return true;
  }

  Future<bool> updateUserProfilePicture(BuildContext context) async {
    final profilePictureIsValidOrMessage = validateProfilePicture();
    if (profilePictureIsValidOrMessage == null) {
      final tokenStorage = locator<ITokenStorage>();
      final token = await tokenStorage.read();
      Map<String, dynamic> payload = Jwt.parseJwt(token!.token);

      final _userId = payload['nameid'];
      final result = await context
          .read<ProfileCubit>()
          .updateUserProfilePictureCubit(UploadProfilePictureParam(
            userId: _userId,
            file: await MultipartFile.fromFile(_profilePicture!.path,
                contentType: MediaType('image', 'jpg')),
          ));

      //state = state.setUpdateUserProfilePictureState(State.success(result));

      router.popUntil((route) => route.isFirst);
      router.replace(HomeRoute());

      return true;
    }
    return false;
  }

  Future<void> updateUserInterest(BuildContext context) async {
    final tokenStorage = locator<ITokenStorage>();
    final token = await tokenStorage.read();
    Map<String, dynamic> payload = Jwt.parseJwt(token!.token);

    final _userId = payload['nameid'];
    await context.read<ProfileCubit>().updateUserInterest(
        UpdateUserUnterestRequest(userId: _userId, interestIds: _interest));
  }

  Future<void> createUserProfile(BuildContext context) async {
    String? isValidFormOrErrorMessage = validateLetsKnowYouForm();
    if (isValidFormOrErrorMessage == null) {
      final tokenStorage = locator<ITokenStorage>();
      final token = await tokenStorage.read();
      Map<String, dynamic> payload = Jwt.parseJwt(token!.token);

      final _userId = payload['nameid'];

      //final _locationState = ref.watch(locationViewModelProvider);
      final locationResult = await getLocation();

      // final _location = await context
      //     .read<ProfileCubit>()
      //     .getAddressFromLocationCoordinate();
      // final _latitude = _locationState.getCurrentLocationState.data!.latitude;
      // final _longitude =
      //     _locationState.getCurrentLocationState.data!.longitude;

      final data = CreateUserProfileRequest(
        userId: _userId,
        firstName: _firstName,
        lastName: _lastName,
        dateOfBirth: _dob,
        gender: _gender,
        languageCSV: _languages,
        aboutMe: _aboutMe,
        bodyType: _bodyType,
        complexion: _complexion,
        height: _height,
        occupation: _occupation,
        religion: _religion,
        weight: _weight,
        tagline: _tagline,
        city: _city,
        state: _state,
        country: _country,
        zipCode: _postcode,
        latitude: locationResult!.latitude,
        longitude: locationResult.longitude,
        originCity: _state,
        originCountry: _country,
        maritalStatus: 1,
      );

      await context.read<ProfileCubit>().createProfile(data);

      await updateUserInterest(context);
      //Navigate to profile
      router.push(ProfilePhotoRoute(username: payload['unique_name']));
    }
  }

  Future<AddressFromLocationModel?> getAddressFromLocationCoordinate(
      BuildContext context) async {
    if (_isValidLatLong()) {
      final result = await context
          .read<ProfileCubit>()
          .getAddressFromLocationCoordinateCubit(
              latitude: _latitude!, longitude: _longitude!);
      return result;
    } else {
      NotifyUser.showSnackbar('Invalid Latitude and Longitude');
      return null;
    }
  }

  Future<bool> getCurrentLocation(BuildContext context) async {
    final result = await getLocation();

    if (result != null) {
      _latitude = result.latitude;
      _longitude = result.longitude;

      await getAddressFromLocationCoordinate(context);
      return true;
    } else {
      return false;
    }
  }

  Future<ViewProfileModel?> visitUserProfile(
      BuildContext context, String visitingId) async {
    final result =
        await context.read<ProfileCubit>().visitUserProfileCubit(visitingId);
    print(result);
    visitProfilePage = result;
    return visitProfilePage;
  }

  loadUserRecentActivity(BuildContext context) async {
    final result =
        await context.read<ProfileCubit>().getUserRecentActivityCubit();
    userActivityModel = result;
  }

  Future<int> getMatchedProfileBoost(BuildContext context) async {
    final result =
        await context.read<ProfileCubit>().getMatchedProfileBoostCubit();
    matchedProfileBoostCount = result!;
    return matchedProfileBoostCount!;
  }

  Future<void> createProfileBoost(
      BuildContext context, CreateProfileBoostRequest request) async {
    await context.read<ProfileCubit>().createProfileBoostCubit(request);
    final state = context.read<ProfileCubit>().state;
    if (state is ProfileCreatedProfileBoostState) {
      NotifyUser.showSnackbar(
          'successfully created profile boost for ${request.duration} days');
      router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
    } else {
      NotifyUser.showSnackbar(
          'could not boost profile, please try again later');
    }
  }
}
