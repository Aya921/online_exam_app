class ForgotPasswordStates {

  bool isLoading;
  String? errorMessage;
  bool? isValid;
  bool isSuccess;
  ForgotPasswordStates({
    this.isLoading = false,
    this.errorMessage,
    this.isValid = false,
    this.isSuccess = false,
  });


  ForgotPasswordStates copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isValid,
    bool? isSuccess,
  }) {
    return ForgotPasswordStates(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}