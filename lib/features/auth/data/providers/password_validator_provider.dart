import 'package:flutter_riverpod/legacy.dart';

final passwordValidatorProvider =
    StateNotifierProvider<PasswordValidator, String?>(
      (ref) => PasswordValidator(),
    );

class PasswordValidator extends StateNotifier<String?> {
  PasswordValidator() : super(null);

  void validate(String? password) {
    if (password == null || password.isEmpty) {
      state = 'Please enter your password';
      return;
    }
    if (password.length < 6) {
      state = 'Password must be at least 6 characters';
      return;
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      state = 'Password must contain at least one uppercase letter';
      return;
    }
    if (password != '123456A') {
      state = 'Invalid password';
      return;
    }
    state = null;
  }
}
