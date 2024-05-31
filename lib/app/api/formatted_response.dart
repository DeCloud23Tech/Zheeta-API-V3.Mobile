import 'package:equatable/equatable.dart';

class FormattedResponse extends Equatable {
  final bool success;
  final String message;
  final dynamic data;
  final dynamic errors;
  final int? statusCode;

  FormattedResponse({
    this.data,
    this.errors,
    this.statusCode,
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => [
        errors,
        success,
        message,
        data,
        statusCode,
      ];

  @override
  String toString() {
    return 'FormattedResponse(errors: $errors, success: $success, message: $message, data: $data, statusCode: $statusCode)';
  }
}

class InvalidResponse extends Equatable {
  final String message;
  final dynamic data;
  final dynamic errors;

  InvalidResponse({
    required this.message,
    this.data,
    this.errors,
  });

  @override
  List<Object?> get props => [message, data, errors];

  @override
  String toString() {
    return 'InvalidResponse(message: $message, data: $data, errors: $errors)';
  }
}
