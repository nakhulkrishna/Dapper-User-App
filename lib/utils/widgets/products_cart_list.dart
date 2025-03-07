import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/data/models/cart/cart_model.dart';
import 'package:dapper_user/logic/addtocart/cart_item_bloc.dart';
import 'package:dapper_user/logic/addtocart/cart_item_event.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsListCart extends StatelessWidget {
  const ProductsListCart({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.isSelected,
    required this.cartModel,
    required this.index,
  });

  final double screenHeight;
  final double screenWidth;
  final bool isSelected;
  final CartModel cartModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Replace all occurrences of 'image/upload/' in the URL
    String? imageUrl = cartModel.product.images1;
    String fixedImageUrl = imageUrl?.replaceAll('image/upload/', '') ?? "";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenHeight * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(fixedImageUrl), // Use the fixed URL
                  fit: BoxFit.cover,
                ),
                color: AppColors2.brownColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.product.productName,
                  style: GoogleFonts.poppins(color: AppColors2.brownColor),
                ),
                Row(
                  children: [
                    Text(
                      cartModel.product.material ?? "",
                      style: GoogleFonts.poppins(color: AppColors2.brownColor),
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
                      "${cartModel.quantity ?? 0}",
                      style: GoogleFonts.poppins(color: AppColors2.brownColor),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "₹${cartModel.product.totalPrice}",
                  style: GoogleFonts.poppins(color: AppColors2.brownColor),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(DeleteCartEvent(
                        cartModel.product.id ?? 0,
                      ));
                },
                icon: Icon(
                  EvaIcons.close,
                  color: Appcolor.red,
                ))
          ],
        ),
      ),
    );
  }
}
