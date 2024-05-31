import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';

@prod
@LazySingleton()
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
}
