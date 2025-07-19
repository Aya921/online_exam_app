import 'package:exam_app/core/constant/validator_constants/signup_validator_constants.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';


class LoginValidators {
  final AppLocalizations _appLocalizations;
  LoginValidators({required AppLocalizations appLocalization})
    : _appLocalizations = appLocalization;

  String? loginPasswordValidatiion(String? value) {
    if (value!.length < 6) {
      return _appLocalizations.passwordMinLengthError;
    }
    return null;
  }

  String? loginEmailValidatiion(String? value) {
    if (!RegExp(ValidatorConstants.lognEmailRegex).hasMatch(value!)) {
      return _appLocalizations.pleaseEnterValidEmail;
    }
    return null;
  }
}
