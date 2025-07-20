import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/features/auth/api/client/api_servises.dart';
import 'package:exam_app/features/auth/api/model/forget_password/forget_password_request/forget_password_request.dart';
import 'package:exam_app/features/auth/api/model/forget_password/reset_password_request/reset_password_request.dart';
import 'package:exam_app/features/auth/api/model/forget_password/verify_reset_code_request/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/api/source/auth_remote_data_imp.dart';
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: Center(
        child: Column(
          children: [
            const Text('Forget Password Page Content'),
            ElevatedButton(
              onPressed: () {
                getIt<AuthRemoteDataSource>().resetPassword(
                  ResetPassword(
                    email: 'amedyhia23@gmail.com',
                    newPassword: 'Ahmed@1234',
                  ),
                );
              },
              child: const Text('do Action'),
            ),
          ],
        ),
      ),
    );
  }
}
