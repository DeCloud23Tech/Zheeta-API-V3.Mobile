// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:zheeta/features/profile/data/model/country_states_model.dart';
//
// mixin AsyncDataLoaderMixin {
//   Future<void> loadCountries(Function setState, List<String> allCountries) async {
//     final data = await rootBundle.loadString('assets/json/countries.json');
//     final jsonData = jsonDecode(data) as Map<String, dynamic>;
//     setState(() {
//       allCountries = jsonData.keys.toList();
//     });
//   }
//
//   Future<void> loadStatesForCountry(
//       Function setState, String country, List<String> allStates, String selectedState) async {
//     final data = await rootBundle.loadString('assets/json/countries_states.json');
//     final jsonData = jsonDecode(data) as List<dynamic>;
//
//     final countryStates = jsonData
//         .map((e) => CountryState.fromJson(e))
//         .firstWhere((cs) => cs.name == country, orElse: () => CountryState(name: country, states: []));
//
//     setState(() {
//       allStates = countryStates.states?.map((state) => state.name ?? '').toList() ?? [];
//       selectedState = allStates.isNotEmpty ? allStates[0] : '';
//     });
//   }
// }
