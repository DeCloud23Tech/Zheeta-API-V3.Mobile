import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/core/utils/api.dart';
import 'package:zheeta/domain/models/login_model.dart';
import 'package:zheeta/domain/models/register_model.dart';
import 'package:zheeta/domain/models/user_model.dart';
import 'package:zheeta/domain/models/verify_otp_model.dart';
import 'package:zheeta/presentation/authentication/pages/bio.dart';
import 'package:zheeta/presentation/authentication/pages/location.dart';
import 'package:zheeta/presentation/authentication/pages/verification.dart';
import 'package:zheeta/presentation/homepage/pages/homepage.dart';
import 'package:zheeta/presentation/widgets/snackbar.dart';




class UserService {
  static UserService? _instance;

  factory UserService() => _instance ??= UserService._();

  UserService._();

  Future<void> login(LoginRequest request, context) async {
    var response = await Api()
        .dio
        .post('/userauth/login', data: jsonEncode(request.toJson()));

    if (response.data['statusCode'] == 201) {
      var sessionManager = SessionManager();
      await sessionManager.set("username", request.email);
      await sessionManager.set("password", request.password);

      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: HomePage()));
    } else {
      notify('error', response.data['message']);
      // Navigator.pushReplacement(context,
      //     PageTransition(type: PageTransitionType.fade, child: HomePage()));
    }
  }

  Future<void> register(RegisterRequest request, context) async {
    var response = await Api()
        .dio
        .post('/userauth/register-user', data: jsonEncode(request.toJson()));

    if (response.data['statusCode'] == 201) {
      var sessionManager = SessionManager();
      await sessionManager.set("username", request.email);
      await sessionManager.set("password", request.password);

      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Verification(phone: request.phoneNumber)));
    } else {
      notify('error', response.data['message']);
    }
  }

  Future<void> verifyOtp(VerifyOtpRequest request, context) async {
    var response = await Api()
        .dio
        .post('/userauth/verify-phone-otp', data: jsonEncode(request.toJson()));

    if (response.data['statusCode'] == 201) {
      notify('success', response.data['message']);
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: BioData()));
    } else {
      notify('error', response.data['message']);
    }
  }

  Future<void> updateBio(UserRequest request, context) async {
    var response = await Api()
        .dio
        .post('/user/profile', data: jsonEncode(request.toJson()));

    if (response.data['statusCode'] == 201) {
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: Location()));
    } else {
      notify('error', response.data['message']);
    }
  }

  // Future<GetTermsAndConditionsResponse> getTermsAndConditions() async {
  //   var response = await Api().dio.get('about/terms-and-conditions');

  //   return GetTermsAndConditionsResponse.fromJson(response.data);
  // }
}
