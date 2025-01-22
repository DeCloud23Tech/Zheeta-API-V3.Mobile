// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/common/mixins/validator_mixin.dart';
// import 'package:zheeta/app/common/utils/navigation_utils.dart';
// import 'package:zheeta/app/common/notify/notify_user.dart';
// import 'package:zheeta/app/common/strings.dart';
// import 'package:zheeta/app/common/text_style.dart';
// import 'package:zheeta/app/router/app_router.dart';
// import 'package:zheeta/app/router/app_router.gr.dart';
// import 'package:zheeta/authentication/data/request/register_user_request.dart';
// import 'package:zheeta/authentication/presentation/bloc/authentication_cubit.dart';
// import 'package:zheeta/widgets/input_field.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// @RoutePage()
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> with Validator {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController referralController = TextEditingController();
//
//   bool _agree = false;
//   bool _isPasswordObscure = true;
//   PhoneNumber _phoneNumber =
//       PhoneNumber(countryISOCode: '+1', countryCode: 'US', number: '');
//
//   String _username = '';
//   String _password = '';
//   String _confirmPassword = '';
//   String _email = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondaryLight,
//       body: BlocListener<AuthenticationCubit, AuthenticationState>(
//         listener: (context, state) {
//           // if (state is AuthenticationLoadingState) {
//           //   // Show loading dialog or indicator
//           //   Loader.show(context);
//           // } else
//             if (state is AuthenticationRegisteredState) {
//             // Hide loading dialog and show success message
//             // Loader.hide(context);
//             // ScaffoldMessenger.of(context).showSnackBar(
//             //   SnackBar(content: Text('Registration Successful: ${state.data}')),
//             // );
//             navigateToVerificationPageLogin();
//           } else if (state is AuthenticationErrorState) {
//             // Hide loading dialog and show error message
//             // Loader.hide(context);
//             NotifyUser.showSnackbar(state.errorMessage);
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 60),
//                   Image.asset("assets/images/full-logo.png", height: 36),
//                   const SizedBox(height: 40),
//                   Text(signupTitle, style: authTitleStyle),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () {
//                       router.replace(const SignInRoute());
//                     },
//                     child: Text(signupSubtitle, style: authSubtitleStyle),
//                   ),
//                   const SizedBox(height: 32),
//                   InputField(
//                     hintText: 'Username',
//                     validator: (data) => validateName(data, 'Username'),
//                     controller: usernameController,
//                     onChanged: (value) {
//                       setState(() {
//                         _username = value;
//                       });
//                     },
//                   ),
//                   InputField(
//                     hintText: 'Password',
//                     password: _isPasswordObscure,
//                     validator: (data) => validatePassword(data),
//                     controller: passwordController,
//                     onChanged: (value) {
//                       setState(() {
//                         _password = value;
//                       });
//                     },
//                   ),
//                   InputField(
//                     hintText: 'Retype Password',
//                     password: _isPasswordObscure,
//                     validator: (data) =>
//                         validateConfirmPassword(data, passwordController.text),
//                     controller: confirmPasswordController,
//                     onChanged: (value) {
//                       setState(() {
//                         _confirmPassword = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   InputField(
//                     hintText: 'Email Address',
//                     validator: (data) => validateEmail(data),
//                     controller: emailController,
//                     onChanged: (value) {
//                       setState(() {
//                         _email = value;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   IntlPhoneField(
//                     disableLengthCheck: true,
//                     decoration: InputDecoration(
//                       isDense: true,
//                       filled: true,
//                       fillColor: AppColors.white,
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: AppColors.grey.withOpacity(0.5), width: 1.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: AppColors.primaryDark, width: 1.0),
//                       ),
//                       border: const OutlineInputBorder(),
//                       hintText: "Phone number",
//                       hintStyle: TextStyle(
//                           color: AppColors.grey.withOpacity(0.5), fontSize: 14),
//                       errorStyle: const TextStyle(color: Colors.red),
//                     ),
//                     initialCountryCode: 'US',
//                     controller: phoneController,
//
//                     // onChanged is fine for updating your local state
//                     onChanged: (phone) {
//                       setState(() {
//                         _phoneNumber = phone;
//                       });
//                     },
//
//                     // The validator now extracts the complete number and sends it to the validation function
//                     validator: (phone) {
//                       // Ensure phone is not null and pass complete number to validator
//                       if (phone == null) {
//                         return 'Phone number is required';
//                       }
//                       return isValidPhoneNumber(phone.completeNumber);
//                     },
//
//                     onCountryChanged: (value) {
//                       setState(() {
//                         _phoneNumber = PhoneNumber(
//                           countryISOCode: value.code,
//                           countryCode: value.dialCode,
//                           number: phoneController.text,
//                         );
//                       });
//                     },
//                     autovalidateMode: AutovalidateMode.disabled,
//                   ),
//                   const SizedBox(height: 10),
//                   InputField(
//                     hintText: 'Referral (Optional)',
//                     controller: referralController,
//                     onChanged: (value) {},
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Checkbox(
//                         activeColor: AppColors.primaryDark,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100.0),
//                         ),
//                         side: WidgetStateBorderSide.resolveWith(
//                           (states) => BorderSide(
//                               width: 1.0, color: AppColors.primaryDark),
//                         ),
//                         value: _agree,
//                         onChanged: (value) {
//                           setState(() {
//                             _agree = value!;
//                           });
//                         },
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Agree to our',
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(color: AppColors.black),
//                           ),
//                           GestureDetector(
//                             child: Text(
//                               ' terms?',
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: AppColors.primaryDark),
//                             ),
//                             onTap: () {},
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   BlocBuilder<AuthenticationCubit, AuthenticationState>(
//                     builder: (context, state) {
//                       return PrimaryButton(
//                         title: 'Sign Up',
//                         disabled: !_agree,
//                         state: state is AuthenticationLoadingState,
//                         action: _agree ? _submitForm : null,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState?.validate() ?? false) {
//       _formKey.currentState?.save();
//       RegisterUserRequest request = RegisterUserRequest(
//         userName: _username,
//         email: _email,
//         password: _password,
//         phoneNumber: _phoneNumber.completeNumber,
//         phoneCountryCode: _phoneNumber.countryCode,
//         referralCode:
//             referralController.text.isNotEmpty ? referralController.text : null,
//       );
//       context.read<AuthenticationCubit>().registerUserCubit(request: request);
//     }
//   }
// }
