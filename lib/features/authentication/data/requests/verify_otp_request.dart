class VerifyOtpRequest {
  final int type;
  final String? email;
  final String otp;
  final String? phoneNumber;

  VerifyOtpRequest({
    required this.type,
    this.email,
    required this.otp,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "email": email,
      "otp": otp,
      "phoneNumber": phoneNumber,
    };
  }

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      type: json["type"],
      email: json["email"],
      otp: json["otp"],
      phoneNumber: json["phoneNumber"],
    );
  }
}
