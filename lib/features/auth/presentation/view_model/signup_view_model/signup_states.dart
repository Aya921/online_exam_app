// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

class SignupState {
  bool isLoading;
  UserModel? userModel;
  String? errorMessage;
  bool? isValid;

  SignupState({
    this.isLoading = false,
    this.userModel,
    this.errorMessage,
    this.isValid = false,
  });

  SignupState copyWith({
    bool? isLoading,
    UserModel? userModel,
    String? errorMessage,
    bool? isValid,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }
}

// class SignupIntialState extends SignupState {}

// class SignupLoadingState extends SignupState {}
// class SignupValidState extends SignupState {
//   bool isValid;
//   SignupValidState({
//     required this.isValid,
//   });
// }

// class SignupSucessState extends SignupState {
//   UserModel userModel;
//   SignupSucessState({
//     required this.userModel,
//   });

// }

// class SignupFaliedState extends SignupState {
//   String errorMessage;
//   SignupFaliedState({required this.errorMessage});
// }
