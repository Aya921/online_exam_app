import 'package:exam_app/core/constant/validator_constants/signup_validator_constants.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';

class Validator {
  final AppLocalizations _appLocalizations;
    final passwordRegex = RegExp(ValidatorConstants.passwordRegex);
  Validator({required AppLocalizations appLocalization})
    : _appLocalizations = appLocalization;

  String? oldPasswordValidatiion(String? value) {
    if (value!.isEmpty) {
      return _appLocalizations.thisFieldIsRequired;
    }
      if (!passwordRegex.hasMatch(value)) {
      return _appLocalizations.invalidPasswordFormat;
    }
    if (value.length < 6) {
      return _appLocalizations.passwordMinLengthError;
    }

    return null;
  }

  String? passwordValidation(String? value) {
  

    if (!passwordRegex.hasMatch(value!)) {
      return _appLocalizations.invalidPassword;
    }
    return null;
  }

  String? isPasswordsMatch(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return _appLocalizations.pleaseConfirmYourPassword;
    }
    if (password != confirmPassword) {
      return _appLocalizations.passwordNotMatched;
    }
    return null; // valid
  }
}
