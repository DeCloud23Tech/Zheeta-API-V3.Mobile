import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/viewmodel/location_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_interest_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/location_bottomsheet.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postcode = TextEditingController();
  late UserProfileViewModel userProfileViewModel;
  late UserInterestViewModel userInterestViewModel;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userProfileViewModel = ref.read(userProfileViewModelProvider.notifier);
    userInterestViewModel = ref.read(userInterestViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      populateLocationField();
      userProfileViewModel.loadCountry();
      //userProfileViewModel.loadSelectedCountryStates('Nigeria');
    });
  }

  populateLocationField() async {
    await locationBottomSheet(context);
    final addressState = ref
        .watch(locationViewModelProvider)
        .getAddressFromLocationCoordinateState;
    if (addressState.isSuccess) {
      _address.text = addressState.data!.address ?? '';
      userProfileViewModel.setAddress(addressState.data!.address ?? '');
      _city.text = addressState.data!.city ?? '';
      userProfileViewModel.setCity(addressState.data!.city ?? '');
      _postcode.text = addressState.data!.postalCode ?? '';
      userProfileViewModel.setPostcode(addressState.data!.postalCode ?? '');
      userProfileViewModel
          .loadSelectedCountryStates(addressState.data!.country);
      //userProfileViewModel.setState(addressState.data!.state);
      userProfileViewModel.setCountry(addressState.data!.country);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userInterestState = ref.watch(userInterestViewModelProvider);
    final userProfileState = ref.watch(userProfileViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                CustomBackButton(),
                SizedBox(height: 40),
                InputField(
                  controller: _address,
                  hintText: 'Enter Address',
                  onChanged: (value) => userProfileViewModel.setAddress(value),
                  validator: (data) => userProfileViewModel.validateAddress(),
                ),
                InputField(
                  controller: _city,
                  hintText: 'City',
                  onChanged: (value) => userProfileViewModel.setCity(value),
                  validator: (data) => userProfileViewModel.validateCity(),
                ),
                InputField(
                  controller: _postcode,
                  hintText: 'Zip/Postcode',
                  onChanged: (value) => userProfileViewModel.setPostcode(value),
                  validator: (data) => userProfileViewModel.validatePostcode(),
                ),
                DropdownInputField(
                  value: userProfileState.selectedCountryState.data,
                  hintText: 'Country',
                  onChanged: (value) {
                    userProfileViewModel.setCountry(value);
                    userProfileViewModel.loadSelectedCountryStates(value!,
                        clearState: true);
                  },
                  validator: (data) => userProfileViewModel.validateCountry(),
                  items: userProfileState.countryState.data ?? [],
                ),
                DropdownInputField(
                  value: userProfileState.selectedCityState.data,
                  hintText: 'State',
                  onChanged: (value) => userProfileViewModel.setState(value),
                  validator: (data) => userProfileViewModel.validateState(),
                  items: userProfileState.cityState.data ?? [],
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Continue',
                    state: userInterestState.getInterestState.isLoading,
                    action: () async {
                      if (formKey.currentState!.validate()) {
                        final interestIsFetched =
                            await userInterestViewModel.getInterests();
                        if (interestIsFetched) router.push(const AboutRoute());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
