
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
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
        SigninReqParams(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if(state is SigninLoading){
          isLoading = true;}
        if (state is SigninSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(

            const SnackBar(
              backgroundColor: AppColors.green,
              content: Text('Login successful'),
            )
          );
          isLoading = false;
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
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: textTheme.bodyMedium,
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.enterYourEmail,
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterYourEmail;
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return AppLocalizations.of(context)!.pleaseEnterValidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: textTheme.bodyMedium,
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return  AppLocalizations.of(context)!.enterYourPassword;
                  }
                  if (value.length < 6) {
                    return AppLocalizations.of(context)!.passwordMinLengthError;
                  }
                  return null;
                },
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
                  Text(AppLocalizations.of(context)!.rememberMe, style: textTheme.bodyMedium),
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
                      ? const CircularProgressIndicator(
                        color: AppColors.white,
                      )
                    :  Text(AppLocalizations.of(context)!.login),
                ),
              ),
              const SizedBox(height: 16),
              const LoginFooter(),
            ],
          ),
        );
      },
    );
  }
}
