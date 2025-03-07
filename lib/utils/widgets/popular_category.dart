import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    List<String> categorys = ["Shirt", "Pant", "Jeans", "T Shirts", "Shorts"];
    return SizedBox(
      height: screenHeight * 0.13,
      child: ListView.builder(
        itemCount: categorys.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: Container(
              height: screenWidth * 0.2, // Same value for height and width
              width: screenWidth * 0.2,
              decoration: BoxDecoration(
                color: AppColors2.baseColor, // Background color for the circle
                shape: BoxShape.circle, // Makes the container circular
              ),
              child: Center(
                  child: Text(
                categorys[index],
                style: GoogleFonts.poppins(
                    color: AppColors2.brownColor, fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      ),
    );
  }
}
