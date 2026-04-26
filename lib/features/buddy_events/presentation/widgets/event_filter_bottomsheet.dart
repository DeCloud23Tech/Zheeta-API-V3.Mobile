import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

// Hold the filter results
class EventFilterResult {
  final String? category;
  final String? eventType;
  final String? country;
  final String? state;
  final String? city;

  EventFilterResult({
    this.category,
    this.eventType,
    this.country,
    this.state,
    this.city,
  });
}

// Return the new result class
Future<EventFilterResult?> eventFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet<EventFilterResult?>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
    BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.8), // Adjusted height for more fields
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const EventFilterBottomSheetView();
    },
  );
}

class EventFilterBottomSheetView extends StatefulWidget {
  const EventFilterBottomSheetView({super.key});

  @override
  State<EventFilterBottomSheetView> createState() =>
      _EventFilterBottomSheetViewState();
}

class _EventFilterBottomSheetViewState extends State<EventFilterBottomSheetView> {
  // Cubit and state variables for filters
  final AuthenticateCountryCubit _authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();

  String? _selectedCategory;
  String? _selectedEventType;
  String? _selectedCountry;
  String? _selectedCity;

  @override
  void initState() {
    super.initState();
    _authenticateCountryCubit.fetchAllCountries();
  }

  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xffDADADA),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 42,
                    height: 42,
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 26,
                      color: AppColors.grey.withValues(alpha: 0.8),
                    ),
                  ),
                ),
                const Text(
                  'Event Filter',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: _clearFilters,
                  child: const Text(
                    'Clear Filter',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 5. Add the filter fields
            const Text('Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            DropdownInputField(
              value: _selectedCategory,
              items: AppLists.eventCategories,
              hintText: 'Select category',
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
            const SizedBox(height: 15),

            const Text('Event type',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Expanded(
                  child: _buildEventTypeButton('Free'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildEventTypeButton('Paid'),
                ),
              ],
            ),
            const SizedBox(height: 15),

            const Text('Country',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
              bloc: _authenticateCountryCubit,
              builder: (context, state) {
                return DropdownInputField(
                  value: _selectedCountry,
                  items: state.countries.map((c) => c.name ?? '').toList(),
                  hintText: 'Select Country',
                  onChanged: (value) {
                    if (value != null && value != _selectedCountry) {
                      setState(() {
                        _selectedCountry = value;
                        _selectedCity = null;
                      });
                      final countryCode = state.countries
                          .firstWhere((c) => c.name == value,
                              orElse: () => CountryModel(code: ''))
                          .code;
                      if (countryCode != null && countryCode.isNotEmpty) {
                        _authenticateCountryCubit.fetchCountryDetails(countryCode);
                      }
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 15),

            // const Text('State',
            //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            // DropdownInputField(
            //   value: _selectedState,
            //   hintText: 'Select State',
            //   onChanged: (value) {
            //     if (value != null) {
            //       setState(() => _selectedState = value);
            //     }
            //   },
            //   items: _allStates,
            // ),
            // const SizedBox(height: 15),

            const Text('City',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
              bloc: _authenticateCountryCubit,
              builder: (context, countryState) {
                if (_selectedCountry == null || _selectedCountry!.isEmpty) {
                  return DropdownInputField(
                    hintText: 'Select a country first',
                    onChanged: (value) {},
                    items: const [],
                  );
                }

                if (countryState.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child:
                        SpinKitWave(color: AppColors.primaryDark, size: 20.0),
                  );
                }

                final cityList = countryState.selectedCountryDetails?.cities ?? [];

                return DropdownInputField(
                  hintText: 'City',
                  value: _selectedCity,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedCity = value);
                    }
                  },
                  items: cityList.map((city) => city.toString()).toList(),
                );
              },
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                action: () {
                  // Pass the result object back on pop
                  final result = EventFilterResult(
                    category: _selectedCategory,
                    eventType: _selectedEventType,
                    country: _selectedCountry,
                    city: _selectedCity,
                  );
                  Navigator.pop(context, result);
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildEventTypeButton(String label) {
    final isSelected = _selectedEventType == label;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedEventType = isSelected ? null : label;
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDark : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryDark : AppColors.grey,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.white : AppColors.grayscale,
            ),
          ),
        ),
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedEventType = null;
      _selectedCountry = null;
      _selectedCity = null;
    });
  }
}
