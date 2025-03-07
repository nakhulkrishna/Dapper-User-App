import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.text,
    required this.singOrSignup,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;
  final String singOrSignup;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            singOrSignup,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Appcolor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
