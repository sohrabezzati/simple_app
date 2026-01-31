import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/core/constants/rout_names.dart';
import 'package:simple_app/features/auth/data/providers/login_user_repository_provider.dart';
import 'package:simple_app/features/auth/presentation/widgets/text_editing_widget.dart';

import '../../../../core/constants/styles.dart';
import '../../data/providers/emial_validator_provider.dart';
import '../../data/providers/password_validator_provider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginSate = ref.watch(loginUserRepositoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Login Simple',
                  style: Styles.instance.textHeadLinLarg(),
                ),
                TextEditingWidget(
                  controller: _emailController,
                  hint: 'Enter your email',
                  label: 'Email',
                  obscureText: false,
                  errorText: ref.watch(emailValidatorProvider),
                ),
                TextEditingWidget(
                  controller: _passwordController,
                  hint: 'Enter your password',
                  label: 'Password',
                  obscureText: true,
                  errorText: ref.watch(passwordValidatorProvider),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),

                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () async {
                          final loginResult = await ref
                              .read(loginUserRepositoryProvider)
                              .login(
                                _emailController.text,
                                _passwordController.text,
                              );
                          if (loginResult) {
                            _emailController.dispose();
                            _passwordController.dispose();
                            context.pushReplacement(RoutNames.instance.home);
                          }
                        },
                        child: loginSate.isLoggingIn
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: Styles.instance.textBodyMedium(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
