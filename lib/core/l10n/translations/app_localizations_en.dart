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
  String get signup => 'Sign Up';

  @override
  String get userNameLabel => 'Username';

  @override
  String get userNameHint => 'Enter username';

  @override
  String get userNameError => 'Username is not valid';

  @override
  String get firstNameLabel => 'First Name';

  @override
  String get firstNameHint => 'Enter first name';

  @override
  String get firstNameError => 'First name is not valid';

  @override
  String get lastNameLabel => 'Last Name';

  @override
  String get lastNameHint => 'Enter last name';

  @override
  String get lastNameError => 'Last name is not valid';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter email';

  @override
  String get emailError => 'Email is not valid';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter password';

  @override
  String get passwordError => 'Password is not valid';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm password';

  @override
  String get confirmPasswordError => 'Passwords do not match';

  @override
  String get phoneLabel => 'Phone';

  @override
  String get phoneHint => 'Enter phone number';

  @override
  String get phoneError => 'Phone number is not valid';

  @override
  String get signupButtonText => 'Sign Up';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get wait => 'Please wait...';

  @override
  String get welcome => 'Welcome';
}
