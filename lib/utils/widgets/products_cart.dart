import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
    required this.productModel,
  });

  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        child: Container(
          height: screenHeight * 0.22,
          width: screenWidth * 0.5,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors2.brownColor, width: 0.1),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(255, 255, 255, 1)),
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.005),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                      color: Appcolor.color1,
                      borderRadius: BorderRadius.circular(8)),
                  child: productModel.images1_url != null &&
                          productModel.images1_url!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productModel.images1_url!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                                null &&
                                            loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                .expectedTotalBytes!)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(child: Text('Image Load Failed')),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      productModel.productName,
                      style: GoogleFonts.poppins(),
                    ),
                    const Spacer(),
                    const Icon(
                      EvaIcons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Text(
                      "4.8",
                      style: GoogleFonts.poppins(),
                    )
                  ],
                ),
                Text(
                  productModel.material ?? '',
                  style: GoogleFonts.poppins(color: AppColors2.baseWithOpacity),
                ),
                Row(
                  children: [
                    Text(
                      "₹${productModel.totalPrice}",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text("${productModel.stock} in stock")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
