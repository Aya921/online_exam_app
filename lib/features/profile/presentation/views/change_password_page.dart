import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/presentation/validator/validetor.dart';
import 'package:exam_app/features/profile/presentation/views/pages/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late ChangePasswordBody body;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  

  bool isAnyValueInputed = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
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

        title: const Text('Reset password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 32),
                CustomTextFormField(
                  onChanged: () {
                    isAnyValueInputed = true;
                    setState(() {});
                  },
                  validator: Validator(appLocalization: t!).passwordValidatiion,
                  label: 'Current password',
                  obsecureTxt: true,
                  emptyFiledErrorMessage: 'Password cannot be empty',
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  validator: Validator(appLocalization: t).passwordValidatiion,
                  label: 'New password',
                  obsecureTxt: true,
                  emptyFiledErrorMessage: 'Password cannot be empty',
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  validator: Validator(appLocalization: t).passwordValidatiion,

                  label: 'Confirm password',
                  obsecureTxt: true,
                  emptyFiledErrorMessage: 'Password cannot be empty',
                ),
                const SizedBox(height: 54),
                ElevatedButton(
                  onPressed: isAnyValueInputed
                      ? () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
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
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
