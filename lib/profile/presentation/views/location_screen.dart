import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/location_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_interest_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/location_bottomsheet.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postcode = TextEditingController();
  late UserProfileViewModel userProfileViewModel;
  //late UserInterestViewModel userInterestViewModel;

  String selectedState = '';
  String selectedCountry = 'Nigeria';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userProfileViewModel = locator<UserProfileViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await populateLocationField();
      setState(() {
        userProfileViewModel.loadCountry();
      });

      userProfileViewModel.loadSelectedCountryStates(selectedCountry);
    });
    super.didChangeDependencies();
  }

  populateLocationField() async {
    await locationBottomSheet(context);
    final addressState =
        await userProfileViewModel.getAddressFromLocationCoordinate(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (addressState != null) {
        _address.text = addressState.address ?? '';
        userProfileViewModel.setAddress(addressState.address ?? '');
        _city.text = addressState.city ?? '';
        userProfileViewModel.setCity(addressState.city ?? '');
        _postcode.text = addressState.postalCode ?? '';
        userProfileViewModel.setPostcode(addressState.postalCode ?? '');
        await userProfileViewModel
            .loadSelectedCountryStates(addressState.country);
        setState(() {
          selectedCountry = addressState.country;
          selectedState = userProfileViewModel.allStates[0];
        });

        userProfileViewModel.setState(userProfileViewModel.allStates[0]);
        userProfileViewModel.setCountry(addressState.country);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
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
                    onChanged: (value) =>
                        userProfileViewModel.setAddress(value),
                    validator: (data) => userProfileViewModel.validateAddress(),
                  ),
                  DropdownInputField(
                    value: selectedCountry,
                    hintText: 'Country',
                    onChanged: (value) async {
                      await new Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          userProfileViewModel.setCountry(value);

                          userProfileViewModel.loadSelectedCountryStates(value!,
                              clearState: true);
                        });
                      });

                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          selectedState = userProfileViewModel.allStates[0];
                          userProfileViewModel.setState(selectedState);
                        });
                      });
                    },
                    validator: (data) => userProfileViewModel.validateCountry(),
                    items: userProfileViewModel.allCountries.length > 0
                        ? userProfileViewModel.allCountries
                        : [],
                  ),
                  DropdownInputField(
                    value: selectedState,
                    hintText: 'State',
                    onChanged: (value) => userProfileViewModel.setState(value),
                    validator: (data) => userProfileViewModel.validateState(),
                    items: userProfileViewModel.allStates.length > 0
                        ? userProfileViewModel.allStates
                        : [],
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
                    onChanged: (value) =>
                        userProfileViewModel.setPostcode(value),
                    validator: (data) =>
                        userProfileViewModel.validatePostcode(),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: 'Continue',
                      state: state is ProfileLoadingState,
                      action: () async {
                        if (formKey.currentState!.validate()) {
                          final interestIsFetched =
                              await userProfileViewModel.getInterests(context);
                          if (interestIsFetched) router.push(AboutRoute());
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
    });
  }
}
