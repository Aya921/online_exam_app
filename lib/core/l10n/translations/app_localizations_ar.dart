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
  String get signup => 'إنشاء حساب جديد';

  @override
  String get userNameLabel => 'اسم المستخدم';

  @override
  String get userNameHint => 'ادخل اسم المستخدم';

  @override
  String get emptyUserNameError => 'اسم المستخدم غير صالح';

  @override
  String get firstNameLabel => 'الاسم الأول';

  @override
  String get firstNameHint => 'ادخل الاسم الأول';

  @override
  String get emptyFirstNameError => 'الاسم الأول غير صالح';

  @override
  String get lastNameLabel => 'اسم العائلة';

  @override
  String get lastNameHint => 'ادخل اسم العائلة';

  @override
  String get emptyLastNameError => 'اسم العائلة غير صالح';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailHint => 'ادخل البريد الإلكتروني';

  @override
  String get emptyEmailError => 'البريد الإلكتروني غير صالح';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get passwordHint => 'ادخل كلمة المرور';

  @override
  String get emptyPasswordError => 'كلمة المرور غير صالحة';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get emptyConfirmPasswordError => 'كلمتا المرور غير متطابقتين';

  @override
  String get phoneLabel => 'رقم الهاتف';

  @override
  String get phoneHint => 'ادخل رقم الهاتف';

  @override
  String get emptyPhoneError => 'رقم الهاتف غير صالح';

  @override
  String get signupButtonText => 'تسجيل حساب';

  @override
  String get alreadyHaveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get wait => 'يرجى الانتظار...';

  @override
  String get welcome => 'مرحبًا بك ';

  @override
  String get tooShort => 'يجب ألا يقل الاسم عن 3 حروف';

  @override
  String get invalidName => 'ادخل اسم صحيح';

  @override
  String get invalidEmail => 'ادخل بريد إلكتروني صحيح';

  @override
  String get invalidPassword =>
      'كلمة السر يجب أن تحتوي على 8 أحرف على الأقل،\nوتتضمن حرف كبير وصغير ورقم ورمز خاص';

  @override
  String get confirmPasswordMismatch =>
      'تأكيد كلمة السر غير متطابق مع كلمة السر';

  @override
  String get invalidPhoneNumber => 'أدخل رقم هاتف مصري صحيح';
}
