import 'package:flutter/material.dart';

mixin ValidationHelperMixin {
  String? isValidInput(String? data, {int? minLength = 1, int? maxLength}) {
    if (data == null) return 'Input is empty';
    data = data.trim();
    if (data.isEmpty) return 'Input is empty';
    if (data.length < (minLength == 5 ? 1 : minLength ?? 1)) {
      return 'Input is lesser than $minLength characters.';
    }
    if (maxLength != null) {
      if (data.length > maxLength) {
        return "Input must be at most $maxLength characters.";
      }
    }

    return null;
  }

  String? isValidNumber(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9]+$');
    if (charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid number';
  }

  String? isValidAmount(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9₦,.]+$');
    if (charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid amount';
  }

  String? isValidString(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if (charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

  String? isValidEmail(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if (result != null) return result;

    final RegExp charRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!charRegExp.hasMatch(data)) return 'Input is not a valid email';
    return null;
  }

  String? isValidPassword(String data, {int? minLength}) {
    data = data.trim();
    String? result = isValidInput(data, minLength: 8);
    if (result != null) return result;

    final RegExp charRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!charRegExp.hasMatch(data)) {
      return 'Password should contain at least : \nOne upper case\nOne lower case\nOne digit and one special character';
    }

    return null;
  }

  String? isValidPhoneNumber(String data,
      {int minLength = 9, int maxLength = 15}) {
    data = data.trim();
    String? result = isValidInput(
      data,
      minLength: minLength,
    );
    if (data.length > maxLength) {
      return "Input must be at most $maxLength digits";
    }
    if (data.length < minLength) {
      return "Input must be at least $minLength digits";
    }
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^\+\d{1,3}\d{6,}$');
    if (!charRegExp.hasMatch(data)) {
      return 'Input is not a valid mobile number \nMake sure you include your country code.';
    }
    return null;
  }

  String? validateConfirmPassword(
      String? confirmPassword, String originalPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateAgeInput(
      String? value,
      TextEditingController? minAgeController,
      TextEditingController? maxAgeController,
      {bool isMin = false}) {
    if (value == null || value.isEmpty) return 'Required';
    final intValue = int.tryParse(value);
    if (intValue == null || intValue <= 0) return 'Enter a valid number';

    final minAge = int.tryParse(minAgeController!.text) ?? 0;
    final maxAge = int.tryParse(maxAgeController!.text) ?? 0;

    if (isMin && maxAge > 0 && intValue > maxAge) {
      return 'Min age cannot be greater than max age';
    } else if (!isMin && minAge > 0 && intValue < minAge) {
      return 'Max age cannot be less than min age';
    }
    return null;
  }


  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value != null && value.length > 200) {
      return 'Message should not exceed 200 characters';
    }
    return null;
  }
}
