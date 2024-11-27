import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.controller,
    required this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.verticalPadding,
    this.hint, this.horizntalPadding,
    this.validator,
  });

  final int? maxLines;
  final double? verticalPadding;
  final double? horizntalPadding;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      onSaved: (newValue) => newValue,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizntalPadding ?? 12,
          vertical: verticalPadding ?? 12,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
