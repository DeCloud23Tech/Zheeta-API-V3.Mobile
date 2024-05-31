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
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
    String? result = isValidInput(
      data,
      minLength: minLength,
    );
    if (data.length > maxLength)
      return "Input must be at most $maxLength digits";
    if (data.length < minLength)
      return "Input must be at least $minLength digits";
    if (result != null) return result;

    final RegExp charRegExp = RegExp(r'^\+\d{1,3}\d{6,}$');
    if (!charRegExp.hasMatch(data))
      return 'Input is not a valid mobile number \nMake sure you include your country code.';
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
