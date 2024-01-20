class CustomException implements Exception {
  final String message;

  const CustomException(this.message);

  @override
  String toString() => message;
}

class UserProfileNotCreatedException implements Exception {
  final String message;
  UserProfileNotCreatedException(this.message);

  @override
  String toString() => message;
}

class EmailNotVerifiedException implements Exception {
  final String message;
  EmailNotVerifiedException(this.message);

  @override
  String toString() => message;
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);

  @override
  String toString() => message;
}

class DuplicateRegisterParamException implements Exception {
  final String? usernameException;
  final String? emailException;
  final String? phoneException;
  DuplicateRegisterParamException({
    this.usernameException,
    this.emailException,
    this.phoneException,
  });
}
