class ValidationService{

  static String? isValidInput(String data, {int? minLength = 1}){
    data = data.trim();
    if(data.isEmpty) return 'Input is empty';
    if(data.length < (minLength == 5? 1:minLength?? 1)) return 'Input is lesser than $minLength characters.';

    return null;
  }

  static String? isValidNumber(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9]+$');
    if(charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid number';
  }

  static String? isValidAmount(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9₦,.]+$');
    if(charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid amount';
  }

  static String? isValidString(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if(charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

  static String? isValidEmail(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(!charRegExp.hasMatch(data)) return 'Input is not a valid email';
    return null;
  }

  static String? isValidPassword(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: 8);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(!charRegExp.hasMatch(data)) return 'Password should contain at least : \nOne upper case\nOne lower case\nOne digit and one special character.';

    return null;
  }

  static String? isValidPhoneNumber(String data, {int? minLength}){
    data = data.trim();
    String? result = isValidInput(data, minLength: 11);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if(data.length > 11) return "Input must be 11 digits";
    if(!charRegExp.hasMatch(data)) return 'Input is not a valid mobile number';
    return null;
  }

  static String convertAmount(String amount){
    amount = amount.replaceAll(RegExp('[₦,.]'), '');
    return amount;
  }
}