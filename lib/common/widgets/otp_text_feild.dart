import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  const OtpTextField({
    super.key,
    required this.controller,
    required this.currentFocus,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            currentFocus.unfocus(); // Unfocus the current field
            if (nextFocus != null) {
              FocusScope.of(context)
                  .requestFocus(nextFocus); // Move to the next field
            }
          }
        },
        controller: controller,
        showCursor: false,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, color: Colors.black),
        keyboardType: TextInputType.phone,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Appcolor.blackColor,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Appcolor.blackColor, // Default border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Appcolor.blackColor, // Default border color
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
