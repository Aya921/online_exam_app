// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'امتحانات اونلاين';

  @override
  String get login => 'Login';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterYourEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get emailError => 'البريد الإلكتروني غير صالح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get pleaseEnterYourEmail => 'من فضلك أدخل بريدك الإلكتروني';

  @override
  String get pleaseEnterValidEmail => 'من فضلك أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get signUp => 'سجل الآن';

  @override
  String get signup => 'تسجيل';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get enterUserName => 'أدخل اسم المستخدم';

  @override
  String get passwordMinLengthError =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';

  @override
  String get userNameError => 'اسم المستخدم غير صالح';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get enterFirstName => 'أدخل الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get enterLastName => 'أدخل الاسم الأخير';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get enterConfirmPassword => 'أدخل تأكيد كلمة المرور';

  @override
  String get passwordNotMatched => 'كلمتا المرور غير متطابقتين';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get enterPhoneNumber => 'أدخل رقم الهاتف';

  @override
  String get forgetPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgetPasswordSubtitle => 'من فضلك أدخل البريد المرتبط بحسابك';

  @override
  String get continue_button => 'متابعة';

  @override
  String get emailVerificationTitle => 'التحقق من البريد الإلكتروني';

  @override
  String get emailVerificationSubtitle =>
      'من فضلك أدخل الكود المرسل إلى بريدك الإلكتروني';

  @override
  String get invalidCode => 'رمز غير صالح';

  @override
  String get didntReceiveCode => 'لم يصلك الرمز؟';

  @override
  String get resend => 'أعد الإرسال';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordSubtitle =>
      'كلمة المرور لا يجب أن تكون فارغة ويجب أن تحتوي على 6 أحرف على الأقل، حرف كبير ورقم واحد على الأقل';

  @override
  String get newPassword => 'كلمة المرور الجديدة';
}
