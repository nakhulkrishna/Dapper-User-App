import 'dart:developer';

import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/logic/addtocart/cart_item_bloc.dart';
import 'package:dapper_user/logic/addtocart/cart_item_event.dart';
import 'package:dapper_user/logic/addtocart/cart_item_state.dart';

import 'package:dapper_user/presentation/Shoping/products_details.dart';
import 'package:dapper_user/utils/constants/screenSize/screen_size.dart';
import 'package:dapper_user/utils/widgets/cutom_button.dart';
import 'package:dapper_user/utils/widgets/products_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _storeage = FlutterSecureStorage();
    context.read<CartBloc>().add(FetchCartEvent());
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.whiteColor,
        surfaceTintColor: Appcolor.whiteColor,
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, cartState) {
                if (cartState is CartLoading) {
                  return Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,
                        colors: const [
                          AppColors2.brownColor,
                        ],
                      ),
                    ),
                  );
                } else if (cartState is CartLoadedSuccess) {
                  return ListView.builder(
                    itemCount: cartState.cartProducts.length,
                    itemBuilder: (context, index) {
                      return ProductsListCart(
                        index: index,
                        cartModel: cartState.cartProducts[index],
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        isSelected: true,
                      );
                    },
                  );
                } else if (cartState is CartError) {
                  return Center(child: Text("check Network"));
                }
                return Center(
                  child: Text("Empty Cart"),
                );
              },
            ),
          ),
          SizedBox(
            height: screenHeight * 0.11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Text(
                  //       "subtotal",
                  //       style: GoogleFonts.poppins(
                  //           color: Appcolor.color2.withOpacity(0.5)),
                  //     ),
                  //     Spacer(),
                  //     Text(
                  //       "₹999",
                  //       style: GoogleFonts.poppins(
                  //           color: AppColors2.brownColor,
                  //           fontWeight: FontWeight.w500),
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Discounted amount",
                  //       style: GoogleFonts.poppins(
                  //           color: Appcolor.color2.withOpacity(0.5)),
                  //     ),
                  //     Spacer(),
                  //     Text(
                  //       "₹99",
                  //       style: GoogleFonts.poppins(
                  //           color: AppColors2.brownColor,
                  //           fontWeight: FontWeight.w500),
                  //     )
                  //   ],
                  // ),
                  // Divider(),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Total",
                  //       style: GoogleFonts.poppins(
                  //           color: Appcolor.color2.withOpacity(0.5)),
                  //     ),
                  //     Spacer(),
                  //     Text(
                  //       "₹899",
                  //       style: GoogleFonts.poppins(
                  //           color: AppColors2.brownColor,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: screenHeight * 0.02,
                  // ),
                  Row(
                    children: [
                      CustomeButton(
                        felx: 1,
                        screenHeight: screenHeight,
                        label: "Checkout bill",
                        onTap: () {
                          // Check if the CartBloc is in the loaded state
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
