import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';

mixin AsyncDataLoaderMixin {
  /// Load countries from a JSON file in the assets folder.
  Future<List<String>> loadCountries() async {
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    return jsonData.keys.toList();
  }

  /// Load interests via the ProfileCubit or any other logic.
  Future<void> loadInterests(BuildContext context) async {
    await context.read<ProfileCubit>().getInterestsCubit();
  }
}
