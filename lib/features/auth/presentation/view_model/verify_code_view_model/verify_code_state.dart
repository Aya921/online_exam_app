class VerifyCodeState {

  bool isLoading;
  String? errorMessage;
  bool isSuccess;

  VerifyCodeState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });


  VerifyCodeState copyWith({
    bool? isLoading,
    String? errorMessage,

    bool? isSuccess,
  }) {
    return VerifyCodeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
  
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}