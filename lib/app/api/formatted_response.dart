import 'package:equatable/equatable.dart';

class FormattedResponse extends Equatable {
  final bool success;
  final String message;
  final dynamic data;
  final int? statusCode;

  FormattedResponse({
    this.data,
    this.statusCode,
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => [
        success,
        message,
        data,
        statusCode,
      ];

  @override
  String toString() {
    return 'FormattedResponse(success: $success, message: $message, data: $data, statusCode: $statusCode)';
  }
}

class InvalidResponse extends Equatable {
  final String message;
  final dynamic data;

  InvalidResponse({
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [message, data];

  @override
  String toString() {
    return 'InvalidResponse(message: $message, data: $data)';
  }
}
