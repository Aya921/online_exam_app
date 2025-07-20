import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final viewModel = getIt.get<SigninCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SigninCubit>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          title: Text(
            AppLocalizations.of(context)!.login,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
