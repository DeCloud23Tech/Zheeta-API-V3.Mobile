import 'package:flutter/material.dart';

mixin Validator {
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

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    // Check if the password is empty or null
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Check for length
    else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // Check if it contains at least one capital letter
    else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one capital letter';
    }
    // Check if it contains at least one special character
    else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // Beneficiary Password validation
  String? validateBeneficiaryPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required';
    }
    return null;
  }

  String? isValidPhoneNumber(String data,
      {int minLength = 9, int maxLength = 15}) {
    data = data.trim();

    // Check if input is empty
    if (data.isEmpty) {
      return "Phone number cannot be empty";
    }

    // Check if input exceeds the maximum length
    if (data.length > maxLength) {
      return "Input must be at most $maxLength digits";
    }

    // Check if input is below the minimum length
    if (data.length < minLength) {
      return "Input must be at least $minLength digits";
    }

    // Regular expression to validate international phone numbers
    final RegExp phoneRegExp = RegExp(r'^\+\d{1,3}\d{6,}$');

    // Check if the input matches the phone number pattern
    if (!phoneRegExp.hasMatch(data)) {
      return 'Input is not a valid phone number. Make sure to include your country code.';
    }

    // Input is valid
    return null;
  }

  // Name validation
  String? validateName(String? value, String label) {
    if (value == null || value.isEmpty) {
      return '$label is required';
    }
    return null;
  }

  // Address validation
  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  // City validation
  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    return null;
  }
}
