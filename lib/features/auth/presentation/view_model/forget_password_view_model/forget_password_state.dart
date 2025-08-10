class ForgetPasswordState {
  bool isvrifyCodeSent = false;
  bool isOtpCorrect = false;
  bool isPasswordReset = false;

  String? email = '';

  String? errorOtp = '';
  String? errorEmail = '';
  String? errorPassword = '';

  ForgetPasswordState({
    this.isvrifyCodeSent = false,
    this.isOtpCorrect = false,
    this.email = '',
    this.errorOtp = '',
    this.errorEmail = '',
    this.errorPassword = '',
    this.isPasswordReset = false,
  });

  ForgetPasswordState copyWith({
    bool? isvrifyCodeSent,
    bool? isOtpCorrect,
    String? email,
    String? errorOtp,
    String? errorEmail,
    String? errorPassword,
    bool? isPasswordReset,
  }) {
    return ForgetPasswordState(
      isvrifyCodeSent: isvrifyCodeSent ?? this.isvrifyCodeSent,
      isOtpCorrect: isOtpCorrect ?? this.isOtpCorrect,
      email: email ?? this.email,
      errorOtp: errorOtp ?? this.errorOtp,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
      isPasswordReset: isPasswordReset ?? this.isPasswordReset,
    );
  }
}
