import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/constant/pages_constants/forget_password_constats.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/forget_password_state.dart';
import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
  ForgetPasswordBloc viewModel = getIt.get<ForgetPasswordBloc>();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider<ForgetPasswordBloc>(
      create: (BuildContext context) {
        return widget.viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Password',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                if (state.errorEmail != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorEmail!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.isvrifyCodeSent != true) {
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Forget password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Please enter your email associated to\n your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomTextFormField(
                        label: t.emailLabel,
                        hint: t.emailHint,

                        formFieldValidator: SignupValidators(
                          appLocalization: t,
                        ).emailValidatiion,
                        emptyFiledErrorMessage: t.emptyEmailError,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: FilledButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<ForgetPasswordBloc>().add(
                                      SendResetEmailEvent(
                                        _emailController.text.trim(),
                                      ),
                                    );

                                    autovalidateMode =
                                        AutovalidateMode.disabled;
                                  } else {
                                    autovalidateMode = AutovalidateMode.always;
                                  }
                                },
                                child: Text(
                                  t.continue_button,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }else{
                  return Text('Vrify code sent to ${state.email}');
                }

              },
            ),
          ),
        ),
      ),
    );
  }
}
