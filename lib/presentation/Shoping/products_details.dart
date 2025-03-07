import 'dart:developer';

import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_bloc.dart';
import 'package:dapper_user/logic/addtocart/cart_item_bloc.dart';
import 'package:dapper_user/logic/addtocart/cart_item_event.dart';
import 'package:dapper_user/logic/addtocart/cart_item_state.dart';
import 'package:dapper_user/utils/constants/screenSize/screen_size.dart';
import 'package:dapper_user/utils/widgets/cutom_button.dart';
import 'package:dapper_user/utils/widgets/products_image.dart';
import 'package:dapper_user/utils/widgets/products_name_and_details.dart';
import 'package:dapper_user/utils/widgets/available_Size.dart';
import 'package:dapper_user/utils/widgets/quantity_with_size_head.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final _storeage = FlutterSecureStorage();
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);

    return Scaffold(
      body: Column(
        children: [
          // Brown-colored section taking half of the screen
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        productModel.images1_url ?? "",
                      ),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: screenWidth * 0.5,
                    child: ProductNameAndDetails(
                      productModel: productModel,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),
                  productsImages(
                      productModel: productModel,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth)
                ],
              ),
            ),
          ),
          // White-colored section taking the remaining space
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* sizes and quantity
                    quantityWithsizehead(
                        screenHeight: screenHeight, screenWidth: screenWidth),

                    SizedBox(
                      height: screenHeight * 0.01,
                    ),

                    availableSizes(
                        screenHeight: screenHeight, screenWidth: screenWidth),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),

                    Text(
                      "Products Details",
                      style: GoogleFonts.poppins(
                          color: AppColors2.brownColor,
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.033),
                    ),

                    Text(
                      maxLines: 4,
                      productModel.description,
                      style: GoogleFonts.poppins(
                          color: AppColors2.brownColor.withOpacity(0.7)),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    //* Rating Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5, // Number of stars
                            (index) => Icon(
                              index < 4 // Replace 4 with the actual rating value
                                  ? EvaIcons.star
                                  : EvaIcons.starOutline,
                              color: AppColors2.brownColor,
                              size: screenHeight * 0.025,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "(320 reviews)",
                          style: GoogleFonts.poppins(
                            color: AppColors2.brownColor.withOpacity(0.7),
                            fontSize: screenHeight * 0.02,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.045,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: screenHeight * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors2.brownColor.withOpacity(0.2),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "₹${productModel.totalPrice}",
                              style: GoogleFonts.poppins(
                                  color: AppColors2.brownColor,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        BlocListener<CartBloc, CartState>(
                          listener: (context, state) {
                            if (state is ShowProductAlreadyInCartSnackbar) {
                              // Show a snack bar when product already exists in the cart
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                ),
                              );
                            } else if (state is CartAddedSuccess) {
                              // Show a success message when the product is added successfully
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Product added to cart successfully!'),
                                ),
                              );
                            }
                          },
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartInitial) {
                                return CustomeButton(
                                  onTap: () async {
                                    int quantity = context
                                        .read<StockQuantityBloc>()
                                        .state
                                        .quantity;
                                    context.read<CartBloc>().add(AddToCartEvent(
                                          productModel.id ?? 0,
                                          quantity,
                                        ));
                                  },
                                  felx: 2,
                                  screenHeight: screenHeight,
                                  label: "Add to cart",
                                );
                              } else if (state is CartAddedSuccess) {
                                return CustomeButton(
                                  onTap: () {},
                                  felx: 2,
                                  screenHeight: screenHeight,
                                  label: "Saved to cart",
                                );
                              }
                              return CustomeButton(
                                onTap: () async {
                                  int quantity = context
                                      .read<StockQuantityBloc>()
                                      .state
                                      .quantity;
                                  context.read<CartBloc>().add(AddToCartEvent(
                                        productModel.id ?? 0,
                                        quantity,
                                      ));
                                },
                                felx: 2,
                                screenHeight: screenHeight,
                                label: "Add to cart",
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
