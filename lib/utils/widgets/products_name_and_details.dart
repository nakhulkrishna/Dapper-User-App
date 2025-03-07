import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // Needed for BackdropFilter

class ProductNameAndDetails extends StatelessWidget {
  const ProductNameAndDetails({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.productModel,
  });

  final double screenWidth;
  final double screenHeight;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: screenWidth * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, vertical: screenHeight * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(EvaIcons.arrowIosBackOutline),
                  Text(
                    "Back",
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.15,
            ),
            // Apply blur effect only on this container using BackdropFilter
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // To clip the blur effect
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                child: Container(
                  height: screenHeight * 0.12,
                  decoration: BoxDecoration(
                      color: AppColors2.whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.02, top: screenHeight * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${productModel.stock} in Stock",
                              style: GoogleFonts.poppins(
                                  color: AppColors2.brownColor),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Container(
                              width: 5, // Set the width of the dot
                              height: 5, // Set the height of the dot
                              decoration: BoxDecoration(
                                color: AppColors2.brownColor.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              productModel.category,
                              style: GoogleFonts.poppins(
                                  color:
                                      AppColors2.brownColor.withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Text(
                          maxLines: 1,
                          productModel.productName,
                          style: GoogleFonts.poppins(
                              color: AppColors2.brownColor,
                              fontWeight: FontWeight.w500,
                              fontSize: screenHeight * 0.03),
                        ),
                        Row(
                          children: [
                            Icon(
                              EvaIcons.star,
                              color: AppColors2.brownColor,
                              size: screenHeight * 0.02,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              "4.5",
                              style: GoogleFonts.poppins(
                                  color:
                                      AppColors2.brownColor.withOpacity(0.6)),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: AppColors2.brownColor.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              productModel.material ?? "",
                              style: GoogleFonts.poppins(
                                  color:
                                      AppColors2.brownColor.withOpacity(0.6)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
