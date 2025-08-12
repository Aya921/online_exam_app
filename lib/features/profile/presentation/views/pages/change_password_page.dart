import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/presentation/validator/validetor.dart';
import 'package:exam_app/features/profile/presentation/view_model/cubit/change_password_cubit.dart';
import 'package:exam_app/features/profile/presentation/views/pages/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({super.key});

  final viewModel = getIt<ChangePasswordCubit>();

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool get _isAllFieldsFilled =>
      _currentPasswordController.text.isNotEmpty &&
      _newPasswordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  bool get _doPasswordsMatch =>
      _newPasswordController.text == _confirmPasswordController.text;

  bool isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onFieldChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final validator = Validator(appLocalization: t);

    return BlocProvider(
      create: (context) => widget.viewModel,
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoding) {
            isLoading = true;
          }
          if (state is ChangePasswordFailed) {
            isLoading = false;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state is ChangePasswordSuccess) {
            isLoading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t.passwordChangedSuccessfully),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              title: Text(t.resetPassword),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      CustomTextFormField(
                        controller: _currentPasswordController,
                        onChanged: () => _onFieldChanged(),
                        validator: (value) =>
                            validator.oldPasswordValidatiion(value),
                        label: t.currentPassword,
                        obsecureTxt: true,
                      ),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        controller: _newPasswordController,
                        onChanged: () => _onFieldChanged(),
                        validator: (value) =>
                            validator.passwordValidation(value),
                        label: t.newPassword,
                        obsecureTxt: true,
                      ),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        controller: _confirmPasswordController,
                        onChanged: () => _onFieldChanged(),
                        validator: (value) => validator.isPasswordsMatch(
                          _newPasswordController.text,
                          value,
                        ),
                        label: t.confirmPassword,
                        obsecureTxt: true,
                      ),
                      const SizedBox(height: 54),
                      ElevatedButton(
                        onPressed: _isAllFieldsFilled && _doPasswordsMatch
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  final body = ChangePasswordBody(
                                    oldPassword:
                                        _currentPasswordController.text,
                                    password: _newPasswordController.text,
                                    rePassword: _newPasswordController.text,
                                  );
                                  context
                                      .read<ChangePasswordCubit>()
                                      .changePassword(body);
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          disabledBackgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(t.update),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
