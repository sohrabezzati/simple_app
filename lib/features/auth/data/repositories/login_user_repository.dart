import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/emial_validator_provider.dart';
import '../providers/password_validator_provider.dart';

class LoginUserRepository extends ChangeNotifier {
  final Ref ref;
  LoginUserRepository(this.ref);
  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;

  Future<bool> login(String email, String password) async {
    _isLoggingIn = true;
    notifyListeners();
    ref.read(emailValidatorProvider.notifier).validate(email);
    ref.read(passwordValidatorProvider.notifier).validate(password);
    final emailValidator = ref.read(emailValidatorProvider);
    final passwordValidator = ref.read(passwordValidatorProvider);

    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 2));
    if (emailValidator == null && passwordValidator == null) {
      _isLoggingIn = false;
      notifyListeners();
      return true;
    } else {
      _isLoggingIn = false;
      notifyListeners();
      return false;
    }
  }
}
