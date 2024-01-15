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
