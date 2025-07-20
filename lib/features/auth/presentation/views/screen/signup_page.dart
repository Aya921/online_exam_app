// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_events.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/register_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';

import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_states.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_view_model.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  late SignupViewModel signupViewModel;
  bool active = false;

  @override
  void initState() {
    super.initState();
    signupViewModel = getIt.get<SignupViewModel>();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  SignupRequest makeUserModel() {
    final user = SignupRequest(
      username: _usernameController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
      repassword: _rePasswordController.text,
    );
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => signupViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.signup, style: const TextStyle(fontSize: 30)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocListener<SignupViewModel, SignupState>(
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.wait)));
              } else if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));

                state.errorMessage = null;
              } else if (state.userModel != null && state.isValid == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${t.welcome} ${state.userModel!.firstName}"),
                  ),
                );
                state.userModel = null;
                // Navigator.of(context).pushNamed(AppRoutes.home);
              } else if (state.isValid != null) {
                setState(() {
                  active = state.isValid!;
                });
              }
            },

            child: Form(
              key: signupViewModel.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _usernameController,
                    label: t.userNameLabel,
                    hint: t.userNameHint,
                    formFieldValidator: SignupValidators(
                      appLocalization: t,
                    ).userNameValidatiion,
                    emptyFiledErrorMessage: t.emptyUserNameError,
                    onChanged: () => signupViewModel.add(ValidateSignupEvent()),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _firstNameController,
                          label: t.firstNameLabel,
                          hint: t.firstNameHint,
                          formFieldValidator: SignupValidators(
                            appLocalization: t,
                          ).firstNameValidatiion,
                          emptyFiledErrorMessage: t.emptyFirstNameError,
                          onChanged: () =>
                              signupViewModel.add(ValidateSignupEvent()),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _lastNameController,
                          label: t.lastNameLabel,
                          hint: t.lastNameHint,
                          formFieldValidator: SignupValidators(
                            appLocalization: t,
                          ).lastNameValidatiion,
                          emptyFiledErrorMessage: t.emptyLastNameError,
                          onChanged: () =>
                              signupViewModel.add(ValidateSignupEvent()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: _emailController,
                    label: t.emailLabel,
                    hint: t.emailHint,
                    formFieldValidator: SignupValidators(
                      appLocalization: t,
                    ).emailValidatiion,
                    emptyFiledErrorMessage: t.emptyEmailError,
                    onChanged: () => signupViewModel.add(ValidateSignupEvent()),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _passwordController,
                          label: t.passwordLabel,
                          hint: t.passwordHint,
                          formFieldValidator: SignupValidators(
                            appLocalization: t,
                          ).passwprdValidatiion,
                          emptyFiledErrorMessage: t.emptyPasswordError,
                          obsecureTxt: true,
                          onChanged: () =>
                              signupViewModel.add(ValidateSignupEvent()),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _rePasswordController,
                          label: t.confirmPasswordLabel,
                          hint: t.confirmPasswordHint,
                          confirmPasswordFunction: SignupValidators(
                            appLocalization: t,
                          ).confirmPasswordValidatiion,
                          passwordCompareValue: _passwordController,
                          emptyFiledErrorMessage: t.emptyConfirmPasswordError,
                          obsecureTxt: true,
                          onChanged: () =>
                              signupViewModel.add(ValidateSignupEvent()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    controller: _phoneController,
                    label: t.phoneLabel,
                    hint: t.phoneHint,
                    formFieldValidator: SignupValidators(
                      appLocalization: t,
                    ).phoneValidation,
                    emptyFiledErrorMessage: t.emptyConfirmPasswordError,
                    onChanged: () => signupViewModel.add(ValidateSignupEvent()),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: RegisterButton(
                          active: active,
                          signupButtonText: t.signUp,
                          signupViewModel: signupViewModel,
                          signupRequest: makeUserModel(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  LoginFooter(
                    onpress: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    donotHaveAccountText: AppLocalizations.of(
                      context,
                    )!.alreadyHaveAccount,
                    signupText: AppLocalizations.of(context)!.login,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: t.alreadyHaveAccount,
                  //     children: [
                  //       TextSpan(
                  //         text: t.login,
                  //         style: const TextStyle(
                  //           color: AppColors.blue,
                  //           decoration: TextDecoration.underline,
                  //         ),
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () {
                  //             Navigator.of(context).pushNamed(AppRoutes.login);
                  //           },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
