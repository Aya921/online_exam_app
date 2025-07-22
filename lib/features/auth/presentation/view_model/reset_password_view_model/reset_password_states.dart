class ResetPasswordStates {

  bool isLoading;
  String? errorMessage;
  bool? isValid;
  bool isSuccess;
  ResetPasswordStates({
    this.isLoading = false,
    this.errorMessage,
    this.isValid = false,
    this.isSuccess = false,
  });


  ResetPasswordStates copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isValid,
    bool? isSuccess,
  }) {
    return ResetPasswordStates(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}