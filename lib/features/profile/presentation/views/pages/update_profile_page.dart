import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/user_entity.dart';
import 'package:exam_app/features/exam/domin/usecase/get_all_subjects_usecase.dart';
import 'package:exam_app/features/exam/domin/usecase/get_all_user_data_usecase.dart';
import 'package:exam_app/features/profile/presentation/view_model/cubit/update_profile_cubit.dart';
import 'package:exam_app/features/profile/presentation/views/pages/widgets/custom_text_form_filed.dart';
import 'package:exam_app/features/profile/presentation/views/pages/widgets/profile_image_change.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfilePage extends StatefulWidget {
  UpdateProfilePage({super.key, required this.userEntity});

  final UserEntity userEntity;
  final viewModel = getIt<UpdateProfileCubit>();

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(
    text: '********',
  );

  bool isAnyValueChanged = false;
  Map<String, dynamic> updatedData = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    userNameController.text = widget.userEntity.username ?? '';
    firstNameController.text = widget.userEntity.firstName ?? '';
    lastNameController.text = widget.userEntity.lastName ?? '';
    emailController.text = widget.userEntity.email ?? '';
    phoneController.text = widget.userEntity.phone ?? '';

    _addFieldListeners();
  }
  bool get _areAllFieldsFilled {
  return userNameController.text.trim().isNotEmpty &&
      firstNameController.text.trim().isNotEmpty &&
      lastNameController.text.trim().isNotEmpty &&
      emailController.text.trim().isNotEmpty &&
      phoneController.text.trim().isNotEmpty;
}

  void _addFieldListeners() {
    final fields = {
      'username': userNameController,
      'firstName': firstNameController,
      'lastName': lastNameController,
      'email': emailController,
      'phone': phoneController,
    };

    fields.forEach((key, controller) {
      controller.addListener(() {
        updatedData[key] = controller.text;
        _checkIfDataChanged();
      });
    });
  }

  void _checkIfDataChanged() {
    final originalData = {
      'username': widget.userEntity.username ?? '',
      'firstName': widget.userEntity.firstName ?? '',
      'lastName': widget.userEntity.lastName ?? '',
      'email': widget.userEntity.email ?? '',
      'phone': widget.userEntity.phone ?? '',
    };

    bool hasChanged = false;
    updatedData.forEach((key, value) {
      if (value != originalData[key]) {
        hasChanged = true;
      }
    });

    setState(() {
      isAnyValueChanged = hasChanged;
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const ProfileImageChange(),
                const SizedBox(height: 24),

                // Username
                CustomTextFormField(
                  controller: userNameController,
                  label: 'User name',
                  hint: 'Enter your name',
                  emptyFiledErrorMessage: 'Name cannot be empty',
                ),
                const SizedBox(height: 24),

                // First & Last name
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: firstNameController,
                        label: 'First name',
                        hint: 'Enter your first name',
                        emptyFiledErrorMessage: 'First name cannot be empty',
                      ),
                    ),
                    const SizedBox(width: 17),
                    Expanded(
                      child: CustomTextFormField(
                        controller: lastNameController,
                        label: 'Last name',
                        hint: 'Enter your last name',
                        emptyFiledErrorMessage: 'Last name cannot be empty',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Email
                CustomTextFormField(
                  controller: emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  emptyFiledErrorMessage: 'Email cannot be empty',
                ),
                const SizedBox(height: 24),

                // Password
                Stack(
                  children: [
                    CustomTextFormField(
                      obsecureTxt: true,
                      controller: passwordController,
                      label: 'Password',
                      enabled: false,
                      emptyFiledErrorMessage: 'Password cannot be empty',
                    ),
                    Positioned(
                      right: 16,
                      top: 17,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.changePassword,
                          );
                        },
                        child: Text(
                          'Change',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Phone
                CustomTextFormField(
                  controller: phoneController,
                  label: 'Phone',
                  hint: 'Enter your phone number',
                  emptyFiledErrorMessage: 'Phone number cannot be empty',
                ),
                const SizedBox(height: 48),

                // Update button
                BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileLoadingState) {
                      isLoading = true;
                    }
                    if (state is UpdateProfileSuccessState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColors.green,
                          content: Text("Profile updated successfully!"),
                        ),
                      );
                    }
                    if (state is UpdateProfileFailedState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: isAnyValueChanged && _areAllFieldsFilled
                          ? () {
                              context.read<UpdateProfileCubit>().updateUserData(
                                updatedData,
                              );
                              context.read<GetAllUserDataUsecase>().call();
                              context.read<GetAllSubjectsUsecase>().invok();                            }
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
                          ? const FittedBox(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Update"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
