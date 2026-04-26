import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/match_criteria_cubit/match_criteria_cubit.dart';
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/country_dropdown.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

void matchCriteriaBottomSheetView(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.5,
        maxChildSize: 0.65,
        expand: false,
        builder: (_, controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const MatchCriteriaBottomSheet(),
          );
        },
      );
    },
  );
}

class MatchCriteriaBottomSheet extends StatefulWidget {
  const MatchCriteriaBottomSheet({super.key});

  @override
  MatchCriteriaBottomSheetState createState() =>
      MatchCriteriaBottomSheetState();
}

class MatchCriteriaBottomSheetState extends State<MatchCriteriaBottomSheet>
    with Validator {
  final MatchesCubit matchesCubit = locator<MatchesCubit>();
  final MatchCriteriaCubit matchCriteriaCubit = locator<MatchCriteriaCubit>();
  final AuthenticateCountryCubit authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();

  late String? userId;
  String gender = "Male";
  double minAge = 18;
  double maxAge = 100;
  double distance = 10;
  String selectedCountry = 'United States';
  String? selectedCity;
  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    userId = await TokenUtil.getUserId();
    authenticateCountryCubit.fetchAllCountries();
    if (userId != null) {
      matchCriteriaCubit.getMatchCriteriaCubit(userId: userId!);
    }
  }

  void _clearFormValues() {
    setState(() {
      gender = '';
      minAge = 18;
      maxAge = 100;
      distance = 200;
      selectedCountry = '';
      selectedCity = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final countryList = context.select<AuthenticateCountryCubit, List<String>>(
      (cubit) => cubit.state.countries.map((c) => c.name ?? '').toList(),
    );

    return BlocConsumer<MatchCriteriaCubit, MatchCriteriaState>(
      listener: (context, state) {
        if (state is MatchCriteriaUpdatedState && userId != null) {
          matchesCubit.getMatchCubit(userId: userId!);
        }
      },
      builder: (context, state) {
        if (state is MatchCriteriaLoadingState) {
          return loadingIndicator();
        } else if (state is MatchCriteriaLoadedState && !dataLoaded) {
          selectedCountry = state.matchCriteria.country;
          selectedCity = state.matchCriteria.city ?? "";
          gender = state.matchCriteria.gender;
          minAge = state.matchCriteria.minAge.toDouble();
          maxAge = state.matchCriteria.maxAge.toDouble();
          distance = state.matchCriteria.distance.toDouble();
          dataLoaded = true;
        } else if (state is MatchCriteriaErrorState) {
          return Center(child: Text(state.message));
        }

        return _buildContent(countryList);
      },
    );
  }

  Widget _buildContent(List<String> countryList) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xffFFF1F7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            buildDropdownField('Gender', gender, ["Male", "Female"], (value) {
              setState(() => gender = value!);
            }),
            const SizedBox(height: 10),
            _buildAgeRangeSlider(),
            // const SizedBox(height: 10),
            // _buildDistanceSlider(),
            const SizedBox(height: 20),
            buildDropdownField(
              'Country',
              selectedCountry,
              countryList,
              (value) {
                if (value != null && value != selectedCountry) {
                  setState(() {
                    selectedCountry = value;
                    selectedCity = null; // Reset city selection
                  });

                  final countryCode = context
                      .read<AuthenticateCountryCubit>()
                      .state
                      .countries
                      .firstWhere((c) => c.name == value,
                          orElse: () => CountryModel(code: ''))
                      .code;

                  if (countryCode!.isNotEmpty) {
                    context
                        .read<AuthenticateCountryCubit>()
                        .fetchCountryDetails(countryCode);
                  }
                }
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
              builder: (context, countryState) {
                if (selectedCountry.isEmpty) return const SizedBox.shrink();

                if (countryState.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SpinKitWave(
                      color: AppColors.primaryDark,
                      size: 20.0,
                    ),
                  );
                }

                final cityList =
                    countryState.selectedCountryDetails?.cities ?? [];
                if (cityList.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('No cities available',
                        style: TextStyle(color: Colors.grey)),
                  );
                }

                return DropdownInputField(
                  hintText: 'City',
                  value: selectedCity,
                  validator: isValidInput,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedCity = value);
                    }
                  },
                  items: cityList.map((city) => city.toString()).toList(),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildActionButtons(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackButton(
          icon: Icons.close,
          onTap: () => Navigator.pop(context),
        ),
        const Text(
          'Criteria Filter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _buildAgeRangeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Age Range: ${minAge.toInt()} - ${maxAge.toInt()}",
            style: const TextStyle(fontSize: 16)),
        RangeSlider(
          values: RangeValues(minAge, maxAge),
          min: 18,
          max: 100,
          divisions: 82,
          onChanged: (values) => setState(() {
            minAge = values.start;
            maxAge = values.end;
          }),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
              title: 'Clear',
              invert: true,
              showBorder: true,
              action: _clearFormValues),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: Tooltip(
            message: 'Feature not available yet',
            child: AbsorbPointer(
              child: PrimaryButton(
                title: 'Apply',
                disabled: true,
                action: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Center(
          child: Text(
            'Feature not available yet',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
