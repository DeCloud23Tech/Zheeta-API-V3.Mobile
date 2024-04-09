import 'package:flutter/widgets.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';

class AbountScreenViewModel {
  double height = 0;
  double weight = 0;
  String? bodyType;
  String? complexion;
  String? religion;
  List<String> interest = [];
  List<String>? languages;
  final List<String> bodyTypeList = AppLists.bodyTypes;
  final List<String> complexionList = AppLists.complexions;
  final List<String> religionList = AppLists.religions;
  final List<String> interestList = AppLists.interests;
  final List<String> occupationList = AppLists.occupations..sort();
  final List<String> languageList = AppLists.languages..sort();
  TextEditingController languagesController = TextEditingController();

  UserInterestListModel? interestsList;

  double _height = 0;
  double _weight = 0;

  String _bodyType = '';
  String _complexion = '';
  String _religion = '';
  List<String> _languages = [];
  String _occupation = '';
  String _aboutMe = '';
  String _tagline = '';
  List<int> _interest = [];

  setInterest(int value) {
    if (_interest.contains(value)) {
      _interest.remove(value);
    } else {
      _interest.add(value);
    }
  }

  String? validateInterest() =>
      _interest.isEmpty ? 'Please select at least one interest' : null;

  setHeight(double value) => _height = value;
  setWeight(double value) => _weight = value;

  setBodyType(String value) => _bodyType = value;
  setComplexion(String value) => _complexion = value;
  setReligion(String value) => _religion = value;

  setLanguage(List<String> value) => _languages = value;

  setOccupation(String value) => _occupation = value;
  setAbout(String value) => _aboutMe = value;
  setTagline(String value) => _tagline = value;

  final formKey = GlobalKey<FormState>();


  Future<void> createUserProfile() async {
    
    
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
    
  }
}
