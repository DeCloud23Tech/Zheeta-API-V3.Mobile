// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/common/mixins/validator_mixin.dart';
// import 'package:zheeta/app/common/notify/notify_user.dart';
// import 'package:zheeta/app/common/strings.dart';
// import 'package:zheeta/app/common/text_style.dart';
// import 'package:zheeta/app/common/utils/otp_utils.dart';
// import 'package:zheeta/app/router/app_router.dart';
// import 'package:zheeta/app/router/app_router.gr.dart';
// import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
// import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
// import 'package:zheeta/authentication/presentation/bloc/authentication_cubit.dart';
// import 'package:zheeta/widgets/back_button.dart';
// import 'package:zheeta/widgets/loading_screen.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// @RoutePage()
// class VerificationScreen extends StatefulWidget {
//   final bool isPhoneNumber;
//   final String phoneNumber;
//   final String countryCode;
//   final String email;
//
//   const VerificationScreen({
//     super.key,
//     required this.isPhoneNumber,
//     required this.phoneNumber,
//     required this.countryCode,
//     required this.email,
//   });
//
//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }
//
// class _VerificationScreenState extends State<VerificationScreen>
//     with Validator {
//   final formKey = GlobalKey<FormState>();
//   String _otp = '';
//   bool _sendAgain = true;
//   int _countdown = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.isPhoneNumber) {
//         context
//             .read<AuthenticationCubit>()
//             .sendPhoneVerifyOtpCubit(phone: widget.phoneNumber);
//       } else {
//         // context
//         //     .read<AuthenticationCubit>()
//         //     .sendEmailVerifyOtpCubit(email: widget.email);
//       }
//     });
//   }
//
//   void _startResendOtp() {
//     OtpUtils.startTimer((countdown) {
//       setState(() {
//         _countdown = countdown;
//         _sendAgain = countdown == 0;
//       });
//     }, () {
//       setState(() {
//         _sendAgain = true;
//       });
//     });
//   }
//
//   void _resendOtp() {
//     OtpUtils.resendOtp(
//       context: context,
//       isPhoneNumber: widget.isPhoneNumber,
//       phoneNumber: widget.phoneNumber,
//       email: widget.email,
//       authCubit: context.read<AuthenticationCubit>(),
//       onResent: (success) {
//         if (success) {
//           _startResendOtp();
//         }
//       },
//     );
//   }
//
//   // Verifies the OTP (email/phone) and navigates accordingly
//   Future<void> verifyPhoneOrEmail(BuildContext context) async {
//     final authCubit = context.read<AuthenticationCubit>();
//     bool canGoNext;
//
//     if (widget.isPhoneNumber) {
//       final data =
//           VerifyPhoneOtpRequest(phoneNumber: widget.phoneNumber, otp: _otp);
//
//       canGoNext = await authCubit.verifyPhoneOtpCubit(request: data);
//     } else {
//       final data = VerifyEmailOtpRequest(email: widget.email, otp: _otp);
//
//       canGoNext = await authCubit.verifyEmailOtpCubit(request: data);
//     }
//
//     if (canGoNext) {
//       if (widget.isPhoneNumber) {
//         router.popAndPush(
//           VerificationRoute(
//             isPhoneNumber: false,
//             email: widget.email,
//             phoneNumber: widget.phoneNumber,
//             countryCode: widget.countryCode,
//           ),
//         );
//       } else {
//         router.pushAndPopUntil(const WelcomeRoute(), predicate: (route) => false);
//       }
//     } else {
//       NotifyUser.showSnackbar('Invalid OTP. Please try again.');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthenticationCubit, AuthenticationState>(
//       listener: (context, state) {
//         if (state is AuthenticationErrorState) {
//           NotifyUser.showSnackbar(state.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         return Stack(
//           children: [
//             Scaffold(
//               backgroundColor: AppColors.secondaryLight,
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 60),
//                         CustomBackButton(),
//                         const SizedBox(height: 60),
//                         Center(
//                           child: Column(
//                             children: [
//                               Text(
//                                 "$verificationTitle ${widget.isPhoneNumber ? 'Phone Number' : 'Email'}",
//                                 style: forgotTitleStyle,
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(height: 15),
//                               Text.rich(
//                                 TextSpan(
//                                   text: verificationSubtitle,
//                                   style: forgotSubtitleStyle,
//                                   children: [
//                                     TextSpan(
//                                       text: widget.isPhoneNumber
//                                           ? '${widget.phoneNumber}'
//                                           : widget.email,
//                                       style: TextStyle(
//                                           color: AppColors.primaryDark),
//                                     ),
//                                   ],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 32),
//                         PinCodeTextField(
//                           validator: (data) => isValidInput(data),
//                           autovalidateMode: AutovalidateMode.disabled,
//                           appContext: context,
//                           length: 6,
//                           pinTheme: PinTheme(
//                             selectedFillColor: Colors.white,
//                             selectedColor: AppColors.black,
//                             inactiveFillColor: AppColors.white,
//                             inactiveColor: AppColors.grey,
//                             shape: PinCodeFieldShape.box,
//                             borderWidth: 1,
//                             activeColor: AppColors.primaryLight,
//                             borderRadius: BorderRadius.circular(4),
//                             fieldHeight: 50,
//                             fieldWidth: 50,
//                             activeFillColor: AppColors.white,
//                           ),
//                           cursorColor: AppColors.black,
//                           onChanged: (value) {
//                             setState(() {
//                               _otp = value;
//                             });
//                           },
//                         ),
//                         const SizedBox(height: 22),
//                         Center(
//                           child: _sendAgain
//                               ? GestureDetector(
//                                   onTap: _resendOtp,
//                                   child: Text(
//                                     'Resend OTP',
//                                     style:
//                                         TextStyle(color: AppColors.primaryDark),
//                                   ),
//                                 )
//                               : Text(
//                                   'Send Again OTP (${_countdown}\s)',
//                                   style: TextStyle(
//                                       color: Colors.blue.withOpacity(0.5)),
//                                 ),
//                         ),
//                         const SizedBox(height: 32),
//                         RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             text:
//                                 "Failed to receive your ${widget.isPhoneNumber ? 'Phone Number' : 'Email'} verification OTP. Contact our support at ",
//                             style: forgotSubtitleStyle,
//                             children: [
//                               TextSpan(
//                                 text: ' support@zheeta.com',
//                                 style: TextStyle(color: AppColors.primaryDark),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               bottomNavigationBar: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 20.0, right: 20.0, bottom: 50.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       child: PrimaryButton(
//                         state: state is AuthenticationLoadingState,
//                         title: 'Continue',
//                         action: () async {
//                           final isValid = formKey.currentState?.validate();
//                           if (isValid ?? false) {
//                             await verifyPhoneOrEmail(context);
//                           }
//                         },
//                       ),
//                     ),
//                     if (widget.isPhoneNumber) const SizedBox(height: 20),
//                     if (widget.isPhoneNumber)
//                       SizedBox(
//                         width: double.infinity,
//                         child: PrimaryButton(
//                           invert: true,
//                           title: 'Skip',
//                           action: () {
//                             router.popAndPush(
//                               VerificationRoute(
//                                 isPhoneNumber: false,
//                                 email: widget.email,
//                                 phoneNumber: widget.phoneNumber,
//                                 countryCode: widget.countryCode,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             if (state is AuthenticationLoadingState) const LoadingScreen(),
//           ],
//         );
//       },
//     );
//   }
// }
