import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/presentation/views/screen/forget_password_page.dart';
import 'package:exam_app/features/auth/presentation/views/screen/login_page.dart';
import 'package:exam_app/features/auth/presentation/views/screen/signup_page.dart';

import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/presentation/view/pages/exams_page.dart';
import 'package:exam_app/features/exam/presentation/view/pages/main_page.dart';
import 'package:exam_app/features/exam/presentation/view/pages/start_exam_page.dart';

import 'package:exam_app/features/exam/presentation/view/pages/question_page.dart';
import 'package:exam_app/features/profile/presentation/views/change_password_page.dart';



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
      case AppRoutes.main:
        return MaterialPageRoute(builder: (context) => MainPage());
      case AppRoutes.exams:
        return MaterialPageRoute(
          builder: (context) =>
              ExamsPage(subject: settings.arguments as SubjectModel),
        );
      case AppRoutes.startExam:
        return MaterialPageRoute(
          builder: (context) => StartExamPage(
            exam: (settings.arguments as Map<String, dynamic>)['exam'],
            subjectName: (settings.arguments as Map<String, dynamic>)['subjectName'],
          ),


        );
      case AppRoutes.question:
        return MaterialPageRoute(builder: (context) =>  QuesionsPage(emailId:settings.arguments as String,));
   
      case AppRoutes.changePassword:
        return MaterialPageRoute(builder: (context) =>   ChangePasswordPage());
   

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(body: Text("No Route Page")),
        );
    }
  }
}
