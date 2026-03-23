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
  const ApiError({required super.message, super.statusCode});

  @override
  String toString() => 'ApiError: $message (Status Code: $statusCode)';
}

class EmailVeirifedError extends ZheetaError {
  const EmailVeirifedError(
      {required super.message, super.statusCode, this.email, this.phoneNumber});

  final String? email;
  final String? phoneNumber;
}

class StorageError extends ZheetaError {
  const StorageError({required super.message, super.statusCode});

  @override
  String toString() => 'StorageError: $message (Status Code: $statusCode)';
}

// Optionally, add other error types here as needed:
class ValidationError extends ZheetaError {
  const ValidationError({required super.message, super.statusCode = 400});

  @override
  String toString() => 'ValidationError: $message (Status Code: $statusCode)';
}
