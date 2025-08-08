import 'package:exam_app/core/constant/validator_constants/signup_validator_constants.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';

 class Validator {
  final AppLocalizations _appLocalizations;
  Validator({required AppLocalizations appLocalization})
    : _appLocalizations = appLocalization;

  String? passwordValidatiion(String? value) {
    if(value!.isEmpty){
      return'this field is required';
    }
    if (value!.length < 6) {
      return _appLocalizations.passwordMinLengthError;
    }

    return null;
  }

}
