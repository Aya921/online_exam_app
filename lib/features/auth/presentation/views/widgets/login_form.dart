
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
            const SnackBar(
              backgroundColor: AppColors.red,
              content: Text('invalid email or password'),
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
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
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
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: AppColors.gray,
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
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
                  Text('Remember me', style: textTheme.bodyMedium),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: Text(
                      'Forget password?',
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
                      : const Text('Login'),
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
