import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/presentation/views/screen/forget_password_page.dart';
import 'package:exam_app/features/auth/presentation/views/screen/login_page.dart';
import 'package:exam_app/features/auth/presentation/views/screen/reset_code.dart';
import 'package:exam_app/features/auth/presentation/views/screen/reset_password_page.dart';
import 'package:exam_app/features/auth/presentation/views/screen/signup_page.dart';

import 'package:flutter/material.dart';

abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? '/');

    switch (url.path) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage(),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage(),
        );

      case AppRoutes.resetCode:
        final email = settings.arguments as String;
        return MaterialPageRoute(builder: (context) =>  ResetCode(email: email,));

      
      
      
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Text("No Route Page")),
        );
    }
  }
}
