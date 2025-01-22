mixin Validator {
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

  String? isValidInput(String? data, {int? minLength = 1, int? maxLength}) {
    if (data == null) return 'Input is empty';
    data = data.trim();
    if (data.isEmpty) return 'Input is empty';
    if (data.length < (minLength == 5 ? 1 : minLength ?? 1))
      return 'Input is lesser than $minLength characters.';
    if (maxLength != null) {
      if (data.length > maxLength)
        return "Input must be at most $maxLength characters.";
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


  // Confirm password validation
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      return 'Confirm password does not match';
    }
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
