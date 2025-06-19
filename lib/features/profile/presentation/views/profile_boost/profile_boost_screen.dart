import 'package:auto_route/annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/lists.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_boost_cubit/profile_boost_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/age_range_selector.dart';
import 'package:zheeta/features/profile/presentation/widgets/post_bottom_sheet.dart';
import 'package:zheeta/utils/format_utils.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/country_dropdown.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class ProfileBoostScreen extends StatefulWidget {
  const ProfileBoostScreen({super.key});

  @override
  ProfileBoostScreenState createState() => ProfileBoostScreenState();
}

class ProfileBoostScreenState extends State<ProfileBoostScreen>
    with ValidationHelperMixin {
  final ProfileBoostCubit profileBoostCubit = locator<ProfileBoostCubit>();
  final ChargesCubit _chargesCubit = locator<ChargesCubit>();
  final AuthenticateCountryCubit authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController targetCityController = TextEditingController();
  final TextEditingController minAgeController =
      TextEditingController(text: '18');
  final TextEditingController maxAgeController =
      TextEditingController(text: '35');
  final TextEditingController manualNumberController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController captionController = TextEditingController();

  List<String> allCountries = [];
  String selectedCountry = 'Any Country';
  String selectedGender = 'Male';
  String? maritalStatus;
  double calculatedCost = 0;
  double? costPerUserPerDay;

  UserCarousels selectedMedia = UserCarousels(0, '');

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    authenticateCountryCubit.fetchAllCountries();
    _chargesCubit.getAllChargesCubit();
  }

  void _calculateCost() {
    final targetUsersNumber = double.tryParse(manualNumberController.text) ?? 0;
    final duration = double.tryParse(durationController.text) ?? 0;

    setState(() {
      calculatedCost = costPerUserPerDay! * targetUsersNumber * duration;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Promote Profile',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          userPostsBottomSheet(context, 'gold', [],
                              (List<UserCarousels> selectedImages) {
                            setState(() {
                              selectedMedia = selectedImages[0];
                            });
                          });
                        },
                        child: DottedBorder(
                          dashPattern: [8, 4],
                          strokeWidth: 1.5,
                          color: AppColors.grey.withOpacity(0.5),
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          child: Container(
                            color: AppColors.white,
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                          height: 12,
                                          width: 12,
                                          'assets/images/icons/add-media.svg'),
                                    ),
                                    TextSpan(
                                      text: ' Add',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' file',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      if (selectedMedia.carouselPhotoUrl.isNotEmpty)
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  NetworkImage(selectedMedia.carouselPhotoUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  InputField(
                    controller: captionController,
                    hintText: 'Write a caption (add hashtags if any)',
                    minLine: 4,
                    maxLine: 4,
                    validator: (value) => isValidInput(value),
                  ),
                  buildDropdownField(
                    '',
                    selectedCountry,
                    context.select<AuthenticateCountryCubit, List<String>>(
                      (cubit) => cubit.state.countries
                          .map((c) => c.name ?? '')
                          .toList(),
                    ),
                    (value) {
                      if (value != null && value != selectedCountry) {
                        setState(() {
                          selectedCountry = value;
                        });

                        final countryCode = context
                            .read<AuthenticateCountryCubit>()
                            .state
                            .countries
                            .firstWhere((c) => c.name == value,
                                orElse: () => CountryModel(code: ''))
                            .code;

                        if (countryCode != null && countryCode.isNotEmpty) {
                          context
                              .read<AuthenticateCountryCubit>()
                              .fetchCountryDetails(countryCode);
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<AuthenticateCountryCubit,
                      AuthenticateCountryState>(
                    builder: (context, countryState) {
                      if (countryState.isLoading) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SpinKitWave(
                            color: AppColors.primaryDark,
                            size: 20.0,
                          ),
                        );
                      }

                      if (countryState.selectedCountryDetails == null ||
                          (countryState
                                  .selectedCountryDetails!.cities?.isEmpty ??
                              true)) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('No cities available',
                              style: TextStyle(color: Colors.grey)),
                        );
                      }

                      List<String> cities =
                          countryState.selectedCountryDetails!.cities!.toList();

                      return DropdownInputField(
                        value: targetCityController.text.isNotEmpty ? targetCityController.text : null,
                        hintText: 'Target City',
                        validator: isValidInput,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => targetCityController.text = value);
                          }
                        },
                        items: cities,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownInputField(
                    value: selectedGender,
                    hintText: 'Target Gender',
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                    validator: (value) => isValidInput(value),
                    items: ['Male', 'Female'],
                  ),
                  SizedBox(height: 10),
                  AgeRangeSelector(
                    onAgeRangeChanged: (minAge, maxAge) {
                      setState(() {
                        minAgeController.text = minAge.toString();
                        maxAgeController.text = maxAge.toString();
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  _buildSelectionField(
                      'Marital Status', maritalStatus, AppLists.maritalStatus,
                      (value) {
                    setState(() => maritalStatus = value);
                  }),
                  SizedBox(height: 10),
                  InputField(
                    keyboardType: TextInputType.number,
                    controller: manualNumberController,
                    hintText: 'Target number of users',
                    validator: (value) => isValidInput(value),
                    onChanged: (value) => _calculateCost(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<ChargesCubit, ChargesState>(
                          builder: (context, state) {
                            return Text(
                              'Boost Charges',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryDark,
                              ),
                            );
                          },
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/zheeta-coin-light.svg',
                              height: 12,
                            ),
                            BlocBuilder<ChargesCubit, ChargesState>(
                              builder: (context, state) {
                                if (state is ChargesSuccess) {
                                  final boostPerDayCharge = state.charges.data
                                      .firstWhere((charge) =>
                                          charge.title ==
                                          'Cost-Of-Boost-PerDay')
                                      .amount;
                                  costPerUserPerDay = boostPerDayCharge;
                                  return Text(
                                    '${boostPerDayCharge}0/day',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grayscale,
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InputField(
                    keyboardType: TextInputType.number,
                    controller: durationController,
                    hintText: 'Duration (Days)',
                    validator: (value) => isValidInput(value),
                    onChanged: (value) => _calculateCost(),
                  ),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Promotion Cost',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/zheeta-coin-bold.svg',
                            height: 12,
                          ),
                          Text(
                            calculatedCost.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grayscale,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  BlocListener<ProfileBoostCubit, ProfileBoostState>(
                    listener: (context, state) {
                      if (state is ProfileBoostCreated) {
                        Navigator.pop(context);
                        NotifyUser.showSnackBar(
                            'Profile boost created successfully!');
                      } else if (state is ProfileBoostError) {
                        NotifyUser.showSnackBar(state.message);
                      }
                    },
                    child: PrimaryButton(
                      title: 'Boost Profile',
                      state: profileBoostCubit.state is ProfileBoostLoading,
                      action: () async {
                        final userId = await TokenUtil.getUserId();

                        // Form validation
                        if (!formKey.currentState!.validate()) return;

                        // Null/Empty checks for each required field
                        if (selectedMedia.carouselPhotoUrl == null ||
                            selectedMedia.carouselPhotoUrl!.isEmpty) {
                          NotifyUser.showSnackBar(
                              'Please upload a photo for the ad');
                          return;
                        }

                        if (selectedCountry.isEmpty) {
                          NotifyUser.showSnackBar('Target country is required');
                          return;
                        }

                        if (selectedGender.isEmpty) {
                          NotifyUser.showSnackBar('Target gender is required');
                          return;
                        }

                        if (targetCityController.text.trim().isEmpty) {
                          NotifyUser.showSnackBar('Target city is required');
                          return;
                        }

                        final minAge = int.tryParse(minAgeController.text);
                        final maxAge = int.tryParse(maxAgeController.text);
                        final number =
                            int.tryParse(manualNumberController.text);
                        final duration = int.tryParse(durationController.text);

                        if (minAge == null || maxAge == null) {
                          NotifyUser.showSnackBar(
                              'Please enter valid age range');
                          return;
                        }

                        if (number == null || number <= 0) {
                          NotifyUser.showSnackBar(
                              'Please enter the number of users to target');
                          return;
                        }

                        if (duration == null || duration <= 0) {
                          NotifyUser.showSnackBar('Please enter duration');
                          return;
                        }

                        if (captionController.text.trim().isEmpty) {
                          NotifyUser.showSnackBar('Caption is required');
                          return;
                        }

                        final request = CreateProfileBoostRequest(
                          userId: userId!,
                          photoUrlForAds: selectedMedia.carouselPhotoUrl!,
                          targetCountry: selectedCountry!,
                          targetGender: selectedGender!,
                          targetCity: targetCityController.text,
                          minAge: minAge,
                          maxAge: maxAge,
                          maritalStatus: getMaritalStatusCode(maritalStatus),
                          targetUsersNumber: number,
                          duration: duration,
                          adsCost: calculatedCost.toDouble(),
                          caption: captionController.text.trim(),
                        );

                        profileBoostCubit.createProfileBoostCubit(request);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSelectionField(String title, String? selectedValue,
    List<String> options, Function(String?) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      SizedBox(height: 10),
      Wrap(
        spacing: 15,
        runSpacing: 10,
        children: options.map((value) {
          return AppRadioButton(
            value: value,
            groupValue: selectedValue,
            onChanged: onChanged,
            title: value,
          );
        }).toList(),
      ),
    ],
  );
}
