import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/core/constants/rout_names.dart';
import 'package:simple_app/features/auth/data/providers/login_user_repository_provider.dart';
import 'package:simple_app/features/auth/presentation/widgets/text_editing_widget.dart';

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
          child: Column(
            children: [
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
              TextButton(
                onPressed: () async {
                  final loginResult = await ref
                      .read(loginUserRepositoryProvider)
                      .login(_emailController.text, _passwordController.text);
                  if (loginResult) {
                    context.pushReplacement(RoutNames.instance.home);
                  }
                },
                child: loginSate.isLoggingIn
                    ? const CircularProgressIndicator.adaptive()
                    : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
