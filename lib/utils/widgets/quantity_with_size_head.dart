import 'dart:developer';

import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_bloc.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_event.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_state.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class quantityWithsizehead extends StatelessWidget {
  const quantityWithsizehead({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Size",
          style: GoogleFonts.poppins(
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.w500,
              color: AppColors2.brownColor),
        ),
        Spacer(),
        BlocBuilder<StockQuantityBloc, StockQuantityState>(
          builder: (context, state) {
            return Container(
              height: screenHeight * 0.05,
              width: screenWidth * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors2.baseColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        log("${state.quantity - 1}");
                        context.read<StockQuantityBloc>().add(RemoveQunatity());
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors2.baseWithOpacity,
                        ),
                        child: Center(
                            child: Icon(
                          EvaIcons.minus,
                          size: 15,
                          color: AppColors2.brownColor,
                        )),
                      ),
                    ),
                    Text(
                      state.quantity.toString(),
                      style: GoogleFonts.poppins(),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<StockQuantityBloc>().add(AddQunatity());
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors2.brownColor,
                        ),
                        child: Center(
                            child: Icon(
                          EvaIcons.plus,
                          size: 15,
                          color: AppColors2.baseWithOpacity,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
