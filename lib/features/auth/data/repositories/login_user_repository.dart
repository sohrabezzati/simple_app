import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/email_validator_provider.dart';
import '../providers/password_validator_provider.dart';

class LoginUserRepository extends ChangeNotifier {
  final Ref ref;
  LoginUserRepository(this.ref);

  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      _isLoggingIn = true;
      _errorMessage = null;
      notifyListeners();

      ref.read(emailValidatorProvider.notifier).validate(email);
      ref.read(passwordValidatorProvider.notifier).validate(password);

      final emailValidator = ref.read(emailValidatorProvider);
      final passwordValidator = ref.read(passwordValidatorProvider);

      if (emailValidator != null || passwordValidator != null) {
        _isLoggingIn = false;
        notifyListeners();
        return false;
      }

      await Future.delayed(const Duration(seconds: 2));

      _isLoggingIn = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoggingIn = false;
      _errorMessage = 'An error occurred during login. Please try again.';
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
