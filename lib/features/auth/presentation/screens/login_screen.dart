import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/core/constants/rout_names.dart';
import 'package:simple_app/features/auth/data/providers/login_user_repository_provider.dart';
import 'package:simple_app/features/auth/presentation/widgets/text_editing_widget.dart';
import 'package:simple_app/core/constants/styles.dart';
import '../../data/providers/email_validator_provider.dart';
import '../../data/providers/password_validator_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final loginResult = await ref
          .read(loginUserRepositoryProvider)
          .login(_emailController.text.trim(), _passwordController.text);

      if (!mounted) return;

      if (loginResult) {
        context.pushReplacement(RoutNames.instance.home);
      } else {
        final errorMessage = ref.read(loginUserRepositoryProvider).errorMessage;
        if (errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginUserRepositoryProvider);
    final emailError = ref.watch(emailValidatorProvider);
    final passwordError = ref.watch(passwordValidatorProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    size: 80,
                    color: Colors.deepPurple.shade400,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: Styles.instance
                        .textHeadLinLarg(color: Colors.grey.shade900)
                        .copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    textAlign: TextAlign.center,
                    style: Styles.instance.textBodyMedium(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextEditingWidget(
                    controller: _emailController,
                    hint: 'Enter your email',
                    label: 'Email',
                    obscureText: false,
                    errorText: emailError,
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  TextEditingWidget(
                    controller: _passwordController,
                    hint: 'Enter your password',
                    label: 'Password',
                    obscureText: true,
                    errorText: passwordError,
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shadowColor: Colors.deepPurple.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: loginState.isLoggingIn ? null : _handleLogin,
                      child: loginState.isLoggingIn
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator.adaptive(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              'Sign In',
                              style: Styles.instance
                                  .textBodyMedium(color: Colors.white)
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
