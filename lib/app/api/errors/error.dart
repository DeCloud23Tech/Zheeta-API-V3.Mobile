import 'package:equatable/equatable.dart';

abstract class ZheetaError extends Equatable {
  final String message;
  final int statusCode;
  const ZheetaError({required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}

class ApiError extends ZheetaError {
  ApiError({required super.message, super.statusCode = 500});
}

class StorageError extends ZheetaError {
  StorageError({required super.message, super.statusCode = 500});
}
