import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' show MultipartFile;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/country_states_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/domain/usecase/user_profile_usecase.dart';
import 'package:zheeta/profile/presentation/state/user_profile_state.dart';
import 'package:zheeta/profile/presentation/viewmodel/location_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_interest_viewmodel.dart';

final userProfileViewModelProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileState>((ref) {
  final _userProfileUseCase = locator<UserProfileUseCase>();
  return UserProfileViewModel(_userProfileUseCase, ref);
});

class UserProfileViewModel extends StateNotifier<UserProfileState>
    with ValidationHelperMixin {
  final UserProfileUseCase _userProfileUseCase;
  final Ref ref;
  UserProfileViewModel(this._userProfileUseCase, this.ref)
      : super(
          UserProfileState(
            getSingleUserProfileState: State.init(),
            updateUserProfilePictureState: State.init(),
            getAllUsersProfileState: State.init(),
            createUserProfileState: State.init(),
            updateUserProfileState: State.init(),
            visitUserProfileState: State.init(),
            countryState: State.init(),
            cityState: State.init(),
            selectedCityState: State.init(),
            selectedCountryState: State.init(),
          ),
        );

  final List<String> bodyTypeList = AppLists.bodyTypes;
  final List<String> complexionList = AppLists.complexions;
  final List<String> religionList = AppLists.religions;
  final List<String> interestList = AppLists.interests;
  final List<String> occupationList = AppLists.occupations..sort();
  final List<String> languageList = AppLists.languages..sort();

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

  File? _profilePicture;

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
    state = state.setSelectedCityState(value);
  }

  setCountry(String? value) {
    state = state.setSelectedCountryState(value);
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

  String? validateDob() => this.isValidInput(_dob);

  String? validateAddress() => this.isValidInput(_address);
  String? validateCity() => this.isValidInput(_city);
  String? validatePostcode() => this.isValidInput(_postcode);
  String? validateState() => this.isValidInput(state.selectedCityState.data);
  String? validateCountry() =>
      this.isValidInput(state.selectedCountryState.data);

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

  String? validateProfilePicture() {
    if (_profilePicture == null) {
      return 'Please select your profile picture';
    } else {
      return null;
    }
  }

  loadCountry() async {
    state = state.setCountryState(State.success([]));
    state = state.setCityState(State.success([]));
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    state = state.setCountryState(
      State.success(jsonData.keys.toSet().toList()),
    );
  }

  loadSelectedCountryStates(String country, {bool clearState = true}) async {
    if (clearState) setState(null);
    state = state.setCityState(State.success([]));
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
      state = state.setCityState(State.success(states));
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

  Future<bool> getSingleUserProfile() async {
    state = state.setGetSingleUserProfileState(State.loading());
    try {
      final result = await _userProfileUseCase.getSingleUserProfileUseCase();
      state = state.setGetSingleUserProfileState(State.success(result));
      if (result.data.profile?.profilePhotoURL == null) {
        router.push(ProfilePhotoRoute());
      } else {
        router.popUntil((route) => route.isFirst);
        router.replace(HomeRoute());
      }
      return true;
    } on UserProfileNotCreatedException catch (e) {
      NotifyUser.showSnackbar(e.toString());
      state = state.setGetSingleUserProfileState(State.error(e));
      router.push(BioDataRoute());
      return false;
    } on Exception catch (e) {
      state = state.setGetSingleUserProfileState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> updateUserProfilePicture() async {
    state = state.setUpdateUserProfilePictureState(State.loading());
    try {
      final profilePictureIsValidOrMessage = validateProfilePicture();
      if (profilePictureIsValidOrMessage == null) {
        final userId =
            await sessionManager.get(SessionManagerKeys.authUserIdString);
        final result =
            await _userProfileUseCase.updateUserProfilePictureUseCase(
          userId: userId,
          file: await MultipartFile.fromFile(_profilePicture!.path,
              contentType: MediaType('image', 'jpg')),
        );

        state = state.setUpdateUserProfilePictureState(State.success(result));

        router.popUntil((route) => route.isFirst);
        router.replace(HomeRoute());

        return true;
      } else {
        NotifyUser.showSnackbar(profilePictureIsValidOrMessage);
        state = state.setUpdateUserProfilePictureState(
          State.error(Exception(profilePictureIsValidOrMessage)),
        );
        return false;
      }
    } on Exception catch (e) {
      state = state.setUpdateUserProfilePictureState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> createUserProfile() async {
    state = state.setCreateUserProfileState(State.loading());
    try {
      String? isValidFormOrErrorMessage = validateLetsKnowYouForm();
      if (isValidFormOrErrorMessage == null) {
        final _userId =
            await sessionManager.get(SessionManagerKeys.authUserIdString);

        final _locationState = ref.watch(locationViewModelProvider);

        final _latitude = _locationState.getCurrentLocationState.data!.latitude;
        final _longitude =
            _locationState.getCurrentLocationState.data!.longitude;

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
          state: state.selectedCityState.data!,
          country: state.selectedCountryState.data!,
          zipCode: _postcode,
          latitude: _latitude,
          longitude: _longitude,
          originCity: state.selectedCityState.data!,
          originCountry: state.selectedCountryState.data!,
          maritalStatus: 1,
        );
        final result = await _userProfileUseCase.createUserProfileUseCase(data);

        UserInterestViewModel _userInterestViewModel =
            ref.read(userInterestViewModelProvider.notifier);
        await _userInterestViewModel.updateUserInterest();

        state = state.setCreateUserProfileState(State.success(result));
        return true;
      } else {
        state = state.setCreateUserProfileState(
          State.error(Exception(isValidFormOrErrorMessage)),
        );
        NotifyUser.showSnackbar(isValidFormOrErrorMessage);
        return false;
      }
    } on CreateProfileValidationException catch (e) {
      if (e.originCityException?.isNotEmpty ?? false) {
        for (var message in e.originCityException!) {
          NotifyUser.showSnackbar(message);
        }
      }
      if (e.originCountryException?.isNotEmpty ?? false) {
        for (var message in e.originCountryException!) {
          NotifyUser.showSnackbar(message);
        }
      }
      state = state.setCreateUserProfileState(State.error(e));
      return false;
    } on Exception catch (e) {
      state = state.setCreateUserProfileState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  visitUserProfile(String visitingId) async {
    try {
      final result =
          await _userProfileUseCase.visitUserProfileUseCase(userId: visitingId);
      state = state.setVisitUserProfileState(State.success(result));
      return true;
    } on UserProfileNotCreatedException catch (e) {
      NotifyUser.showSnackbar(e.toString());
      state = state.setGetSingleUserProfileState(State.error(e));
      router.push(BioDataRoute());
      return false;
    } on Exception catch (e) {
      state = state.setGetSingleUserProfileState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _firstName = '';
    _lastName = '';
    _gender = -1;
    _dob = '';

    _address = '';
    _city = '';
    _postcode = '';
    _languages.clear();

    state = state.copyWith(
      selectedCityState: State.success(null),
      selectedCountryState: State.success(null),
    );

    _height = 0;
    _weight = 0;

    _bodyType = '';
    _complexion = '';
    _religion = '';
    _occupation = '';
    _aboutMe = '';
    _tagline = '';

    _profilePicture = null;
  }
}
