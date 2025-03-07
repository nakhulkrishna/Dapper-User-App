// ignore: file_names

import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';

class DTextFormField extends StatelessWidget {
  const DTextFormField({
    super.key,
    required TextEditingController username,
    required this.validator,
    required this.label,
    required this.hint,
    this.textInputType,
    required this.ispassword,
  }) : _username = username;

  final TextEditingController _username;
  final String label;
  final bool? ispassword;
  final String hint;
  final TextInputType? textInputType;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispassword ?? false,
      keyboardType: textInputType,
      controller: _username,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: Appcolor.blackColor),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolor.blackColor)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Appcolor.blackColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Appcolor.blackColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
