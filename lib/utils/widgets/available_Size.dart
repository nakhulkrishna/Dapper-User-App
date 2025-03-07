import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class availableSizes extends StatelessWidget {
  const availableSizes({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    return SizedBox(
      height: screenHeight * 0.065,
      width: screenWidth,
      child: ListView.builder(
        itemCount: sizes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors2.brownColor.withOpacity(0.1))),
              height: screenHeight * 0.05,
              width: screenWidth * 0.15,
              child: Center(
                  child: Text(
                sizes[index],
                style: GoogleFonts.poppins(color: AppColors2.brownColor),
              )),
            ),
          );
        },
      ),
    );
  }
}
