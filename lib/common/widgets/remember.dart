import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';

class RemeberSecion extends StatelessWidget {
  const RemeberSecion({
    super.key,
    required this.rememberPassword,
    required this.policys,
    required this.isSignUp,
    this.onTap,
  });

  final bool rememberPassword;
  final VoidCallback? onTap;
  final String policys;
  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberPassword,
              onChanged: (bool? value) {},
              activeColor: Appcolor.blackColor,
            ),
            Text(
              policys,
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
        isSignUp
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Appcolor.primary,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
