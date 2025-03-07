import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/logic/products/products_bloc.dart';
import 'package:dapper_user/logic/products/products_event.dart';
import 'package:dapper_user/logic/products/products_state.dart';
import 'package:dapper_user/presentation/Shoping/products_details.dart';
import 'package:dapper_user/utils/constants/icons/app_icons.dart';
import 'package:dapper_user/utils/constants/screenSize/screen_size.dart';
import 'package:dapper_user/utils/widgets/new_feed_sections.dart';
import 'package:dapper_user/utils/widgets/popular_category.dart';
import 'package:dapper_user/utils/widgets/products_cart.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _secureStorage = FlutterSecureStorage();
    context.read<ProductsBloc>().add(FetchProductsEvent());
    //* screen measurements
    double screenWidth = ScreenSize.width(context);
    double screenHeight = ScreenSize.height(context);

    return Scaffold(
      backgroundColor: AppColors2.whiteColor,
      //* AppBar
      appBar: AppBar(
        surfaceTintColor: Appcolor.whiteColor,
        backgroundColor: AppColors2.whiteColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await _secureStorage.delete(key: 'auth_token');
            },
            icon: Icon(AppIcons.bell),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(EvaIcons.menu2Outline),
        ),
        title: Text(
          "Hi There!",
          style: GoogleFonts.playfair(
            fontSize:
                screenHeight * 0.04, // Relative size based on screen height
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //* body content
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* New feed section
            SizedBox(
              height: screenHeight * 0.02,
            ),
            NewFeeds(screenHeight: screenHeight, screenWidth: screenWidth),
            SizedBox(
              height: screenHeight * 0.02,
            ),

            //* Popular Categories
            Text(
              "Popular Categorys",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: screenHeight * 0.025),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            PopularCategory(
                screenHeight: screenHeight, screenWidth: screenWidth),

            //* Most popular products
            SizedBox(
              height: screenHeight * 0.01,
            ),

            Row(
              children: [
                Text(
                  "Most Popular",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: screenHeight * 0.025),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: GoogleFonts.poppins(color: AppColors2.brownColor),
                    ))
              ],
            ),

            SizedBox(
              height: screenHeight * 0.26,
              child: BlocBuilder<ProductsBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    Center(
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
                  } else if (state is ProductLoaded) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductsCard(
                            productModel: state.products[index],
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductsDetails(
                                    productModel: state.products[index],
                                  ),
                                )),
                            screenWidth: screenWidth,
                            screenHeight: screenHeight);
                      },
                    );
                  } else if (state is ProductError) {
                    Center(
                      child: Text("check your Network"),
                    );
                  }

                  return Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,
                        colors: const [Appcolor.blackColor],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
