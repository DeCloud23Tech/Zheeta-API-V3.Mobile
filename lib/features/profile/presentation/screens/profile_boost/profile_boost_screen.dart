import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/charges_cubit/charges_cubit.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_boost_cubit/profile_boost_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/age_range_selector.dart';
import 'package:zheeta/features/profile/presentation/widgets/post_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/country_dropdown.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/radio_button.dart';

@RoutePage()
class ProfileBoostScreen extends StatefulWidget {
  const ProfileBoostScreen({super.key});

  @override
  ProfileBoostScreenState createState() => ProfileBoostScreenState();
}

class ProfileBoostScreenState extends State<ProfileBoostScreen> with Validator {
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

  String selectedCountry = 'Any Country';
  String selectedGender = 'Male';
  String? maritalStatus;

  UserCarousels selectedMedia = UserCarousels(id: '0', carouselPhotoUrl: '');

  @override
  void initState() {
    super.initState();
    authenticateCountryCubit.fetchAllCountries();
    _chargesCubit.getAllChargesCubit();
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
                  /// Media picker
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
                          options: RectDottedBorderOptions(
                            dashPattern: [8, 4],
                            strokeWidth: 1.5,
                            color: AppColors.grey.withValues(alpha: 0.5),
                            strokeCap: StrokeCap.round,
                          ),
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
                      if (selectedMedia.carouselPhotoUrl!.isNotEmpty)
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  NetworkImage(selectedMedia.carouselPhotoUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),

                  /// Caption
                  InputField(
                    controller: captionController,
                    hintText: 'Write a caption (add hashtags if any)',
                    minLine: 4,
                    maxLine: 4,
                    validator: (value) => isValidInput(value),
                  ),

                  /// Country
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
                        setState(() => selectedCountry = value);

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

                  /// Cities
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
                        value: targetCityController.text.isNotEmpty
                            ? targetCityController.text
                            : null,
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

                  /// Gender
                  DropdownInputField(
                    value: selectedGender,
                    hintText: 'Target Gender',
                    onChanged: (value) =>
                        setState(() => selectedGender = value!),
                    validator: (value) => isValidInput(value),
                    items: ['Male', 'Female'],
                  ),
                  SizedBox(height: 10),

                  /// Age Range
                  AgeRangeSelector(
                    onAgeRangeChanged: (minAge, maxAge) {
                      setState(() {
                        minAgeController.text = minAge.toString();
                        maxAgeController.text = maxAge.toString();
                      });
                    },
                  ),
                  SizedBox(height: 10),

                  /// Marital Status
                  _buildSelectionField(
                    'Marital Status',
                    maritalStatus,
                    AppLists.maritalStatus,
                    (value) => setState(() => maritalStatus = value),
                  ),
                  SizedBox(height: 10),

                  /// Target Users
                  InputField(
                    keyboardType: TextInputType.number,
                    controller: manualNumberController,
                    hintText: 'Target number of users',
                    validator: (value) => isValidInput(value),
                    onChanged: (value) =>
                        context.read<ProfileBoostCubit>().calculateCost(
                              users: value,
                              duration: durationController.text,
                            ),
                  ),

                  /// Charges
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Boost Charges',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryDark,
                          ),
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
                                  profileBoostCubit
                                      .setCostPerUserPerDay(boostPerDayCharge);
                                  return Text(
                                    '${boostPerDayCharge}0/day',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grayscale,
                                    ),
                                  );
                                }
                                return SizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Duration
                  InputField(
                    keyboardType: TextInputType.number,
                    controller: durationController,
                    hintText: 'Duration (Days)',
                    validator: (value) => isValidInput(value),
                    onChanged: (value) =>
                        context.read<ProfileBoostCubit>().calculateCost(
                              users: manualNumberController.text,
                              duration: value,
                            ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),

                  /// Total Cost
                  BlocBuilder<ProfileBoostCubit, ProfileBoostState>(
                    builder: (context, state) {
                      final cubit = context.read<ProfileBoostCubit>();
                      final cost = state is ProfileBoostCostCalculated
                          ? state.totalCost
                          : cubit.lastCalculatedCost;

                      return Row(
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
                                cost.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grayscale,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 50),

                  /// Submit
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

                        final request = CreateProfileBoostRequest(
                          userId: userId!,
                          photoUrlForAds: selectedMedia.carouselPhotoUrl!,
                          targetCountry: selectedCountry,
                          targetGender: selectedGender,
                          targetCity: targetCityController.text,
                          minAge: int.tryParse(minAgeController.text),
                          maxAge: int.tryParse(maxAgeController.text),
                          maritalStatus: getMaritalStatusCode(maritalStatus),
                          targetUsersNumber:
                              int.tryParse(manualNumberController.text) ?? 0,
                          duration: int.tryParse(durationController.text) ?? 0,
                          adsCost: context
                              .read<ProfileBoostCubit>()
                              .lastCalculatedCost,
                          //
                          caption: captionController.text.trim(),
                        );

                        if (!context.mounted) return;
                        context
                            .read<ProfileBoostCubit>()
                            .createProfileBoostCubit(request);
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

Widget _buildSelectionField(
  String title,
  String? selectedValue,
  List<String> options,
  Function(String?) onChanged,
) {
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
