import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';
import 'package:exam_app/features/auth/presentation/validator/login_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/core/theme/app_colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_footer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      context.read<SigninCubit>().signIn(
        SignInRequest(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final t = AppLocalizations.of(context)!;
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninLoading) {
          isLoading = true;
        }
        if (state is SigninSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.green,
              content: Text('Login successful'),
            ),
          );
          isLoading = false;
          Navigator.pushReplacementNamed(context, AppRoutes.main);
        }
        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Text(state.errorMessage),
            ),
          );
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 5),

              CustomTextFormField(
                controller: _emailController,
                label: AppLocalizations.of(context)!.email,
                hint: AppLocalizations.of(context)!.enterYourEmail,
                emptyFiledErrorMessage: AppLocalizations.of(
                  context,
                )!.pleaseEnterYourEmail,

                formFieldValidator: LoginValidators(
                  appLocalization: t,
                ).loginEmailValidatiion,
              ),

              const SizedBox(height: 24),
              CustomTextFormField(
                controller: _passwordController,
                label: AppLocalizations.of(context)!.password,
                hint: AppLocalizations.of(context)!.enterYourPassword,
                emptyFiledErrorMessage: AppLocalizations.of(
                  context,
                )!.enterYourPassword,
                obsecureTxt: true,
                formFieldValidator: LoginValidators(
                  appLocalization: t,
                ).loginPasswordValidatiion,
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.gray,
                    side: const BorderSide(color: AppColors.gray, width: 2),
                    value: _rememberMe,
                    onChanged: (val) => setState(() => _rememberMe = val!),
                  ),
                  Text(
                    AppLocalizations.of(context)!.rememberMe,
                    style: textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.forgetPassword);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgetPassword,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: _submit,
                  child: isLoading
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : Text(AppLocalizations.of(context)!.login),
                ),
              ),
              const SizedBox(height: 16),
              LoginFooter(
                onpress: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                primaryText: AppLocalizations.of(
                  context,
                )!.dontHaveAccount,
                secondrytText: AppLocalizations.of(context)!.signUp,
              ),
            ],
          ),
        );
      },
    );
  }
}
