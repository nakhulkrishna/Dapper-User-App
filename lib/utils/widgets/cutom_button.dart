import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.screenHeight,
    required this.label,
    required this.felx,
    required this.onTap,
  });

  final double screenHeight;

  final String label;
  final int felx;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: felx,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: screenHeight * 0.06,
          decoration: BoxDecoration(
            color: AppColors2.brownColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors2.brownColor.withOpacity(0.2),
            ),
          ),
          child: Center(
              child: Text(
            label,
            style: GoogleFonts.poppins(
                color: AppColors2.whiteColor, fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}
