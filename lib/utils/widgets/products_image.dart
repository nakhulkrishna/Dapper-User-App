import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:flutter/material.dart';

class productsImages extends StatelessWidget {
  const productsImages({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.productModel,
  });

  final double screenHeight;
  final double screenWidth;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      if (productModel.images1_url != null &&
          productModel.images1_url!.isNotEmpty)
        productModel.images1_url!,
      if (productModel.images2_url != null &&
          productModel.images2_url!.isNotEmpty)
        productModel.images2_url!,
      if (productModel.images3_url != null &&
          productModel.images3_url!.isNotEmpty)
        productModel.images3_url!,
    ];
    return Positioned(
      top: screenHeight * 0.4,
      left: screenWidth * 0.02,
      right: screenWidth * 0.02,
      bottom: screenWidth * 0.02,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors2.whiteColor,
        ),
        height: screenHeight * 0.1,
        width: screenWidth,
        child: ListView.builder(
          itemCount: imageUrls.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 8, right: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrls[index]),
                        fit: BoxFit.cover),
                    color: AppColors2.baseWithOpacity,
                    borderRadius: BorderRadius.circular(10)),
                height: screenHeight * 0.1,
                width: screenWidth * 0.2,
              ),
            );
          },
        ),
      ),
    );
  }
}
