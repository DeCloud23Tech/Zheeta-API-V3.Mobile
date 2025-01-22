import 'package:equatable/equatable.dart';

abstract class ZheetaError extends Equatable {
  final String message;
  final int statusCode;

  const ZheetaError({
    required this.message,
    this.statusCode = 500, // Set default here for consistency
  });

  @override
  List<Object?> get props => [message, statusCode];

  @override
  String toString() => 'ZheetaError: $message (Status Code: $statusCode)';
}

class ApiError extends ZheetaError {
  ApiError({required String message, int statusCode = 500})
      : super(message: message, statusCode: statusCode);

  @override
  String toString() => 'ApiError: $message (Status Code: $statusCode)';
}

class StorageError extends ZheetaError {
  StorageError({required String message, int statusCode = 500})
      : super(message: message, statusCode: statusCode);

  @override
  String toString() => 'StorageError: $message (Status Code: $statusCode)';
}

// Optionally, add other error types here as needed:
class ValidationError extends ZheetaError {
  ValidationError({required String message, int statusCode = 400})
      : super(message: message, statusCode: statusCode);

  @override
  String toString() => 'ValidationError: $message (Status Code: $statusCode)';
}
