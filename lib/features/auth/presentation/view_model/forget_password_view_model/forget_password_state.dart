class ForgetPasswordState {
  bool isvrifyCodeSent = false;
  bool isOtpCorrect = false;

  String? email = '';

  String? errorOtp = '';
  String? errorEmail = '';

  ForgetPasswordState({
    this.isvrifyCodeSent = false,
    this.isOtpCorrect = false,
    this.email = '',
    this.errorOtp = '',
    this.errorEmail = '',
  });

  ForgetPasswordState copyWith({
    bool? isvrifyCodeSent,
    bool? isOtpCorrect,
    String? email,
    String? errorOtp,
    String? errorEmail,
  }) {
    return ForgetPasswordState(
      isvrifyCodeSent: isvrifyCodeSent ?? this.isvrifyCodeSent,
      isOtpCorrect: isOtpCorrect ?? this.isOtpCorrect,
      email: email ?? this.email,
      errorOtp: errorOtp ?? this.errorOtp,
      errorEmail: errorEmail ?? this.errorEmail,
    );
  }
}
