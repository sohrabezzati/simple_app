import 'package:flutter_riverpod/legacy.dart';

final emailValidatorProvider = StateNotifierProvider<EmailValidator, String?>(
  (ref) => EmailValidator(),
);

class EmailValidator extends StateNotifier<String?> {
  EmailValidator() : super(null);
  void validate(String? email) {
    if (email == null || email.isEmpty) {
      state = 'Please enter your email';
      return;
    }
    if (!email.contains('@')) {
      state = 'Email must contain an @ symbol';
      return;
    }
    if (!email.contains('.com')) {
      state = 'Email must end with .com';
      return;
    }
    if (email != 'test@example.com') {
      state = 'Invalid email';
      return;
    }
    state = null;
  }
}
