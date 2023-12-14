import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
        required this.label,
        this.validator,
        required this.keyboardType,
        required this.obscureText,
        required this.controller,
        this.maxLines,
        this.maxLength,
        this.minLines,
        this.suffixIcon});

  final String label;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      cursorColor:Colors.white,
      decoration: InputDecoration(
        label: Text(label), 
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        enabled: true,
        errorBorder: errorOutlineBorder(),
        focusedErrorBorder: errorOutlineBorder(),
        focusedBorder: outlineBorder(),
        enabledBorder: outlineBorder(),
        border: outlineBorder(),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.white,
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.orange,
      ),
    );
  }

  OutlineInputBorder errorOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }
}