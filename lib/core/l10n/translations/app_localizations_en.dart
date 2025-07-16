// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Exam App';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get emailError => 'This Email is not valid';

  @override
  String get password => 'Password';

  @override
  String get pleaseEnterYourEmail => 'Please enter your email';

  @override
  String get pleaseEnterValidEmail => 'Please enter valid email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgetPassword => 'Forget password?';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get signup => 'Signup';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get userName => 'User name';

  @override
  String get enterUserName => 'Enter your user name';

  @override
  String get passwordMinLengthError => 'Password must be at least 6 characters';

  @override
  String get userNameError => 'This user name is not valid';

  @override
  String get firstName => 'First name';

  @override
  String get enterFirstName => 'Enter first name';

  @override
  String get lastName => 'Last name';

  @override
  String get enterLastName => 'Enter last name';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get enterConfirmPassword => 'Confirm password';

  @override
  String get passwordNotMatched => 'Password not matched';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get forgetPasswordTitle => 'Forget password';

  @override
  String get forgetPasswordSubtitle =>
      'Please enter your email associated to your account';

  @override
  String get continue_button => 'Continue';

  @override
  String get emailVerificationTitle => 'Email verification';

  @override
  String get emailVerificationSubtitle =>
      'Please enter your code that send to your email address';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String get didntReceiveCode => 'Didn\'t receive code?';

  @override
  String get resend => 'Resend';

  @override
  String get resetPasswordTitle => 'Reset password';

  @override
  String get resetPasswordSubtitle =>
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least';

  @override
  String get newPassword => 'New password';
}
