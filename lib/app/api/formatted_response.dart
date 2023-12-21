class FormattedResponse {
  final bool? deviceRegistered;
  final bool success;
  final String? message;
  final dynamic data;
  final String? responseCodeError;
  final int? statusCode;

  FormattedResponse({
    this.deviceRegistered,
    this.data,
    this.responseCodeError,
    this.statusCode,
    required this.success,
    this.message,
  });
}
