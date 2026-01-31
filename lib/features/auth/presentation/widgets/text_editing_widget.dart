import 'package:flutter/material.dart';

class TextEditingWidget extends StatelessWidget {
  const TextEditingWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.validator,
    required this.obscureText,
    this.errorText,
  });
  final TextEditingController controller;
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hint: Text(hint),
        label: Text(label),
        error: errorText != null ? Text(errorText ?? '') : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
