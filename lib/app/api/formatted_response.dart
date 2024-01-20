class FormattedResponse {
  final bool? deviceRegistered;
  final bool success;
  final String message;
  final dynamic data;
  final int? statusCode;

  FormattedResponse({
    this.deviceRegistered,
    this.data,
    this.statusCode,
    required this.success,
    required this.message,
  });
}

class InvalidResponse {
  final String message;
  final dynamic data;

  InvalidResponse({
    required this.message,
    this.data,
  });
}
