import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';

class NewFeeds extends StatelessWidget {
  const NewFeeds({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.2,
      width: screenWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Swiper(
            indicatorLayout: PageIndicatorLayout.DROP,
            physics: ScrollPhysics(parent: CarouselScrollPhysics()),
            itemWidth: screenWidth * 0.9, // Relative to screen width
            itemHeight: screenHeight * 0.16, // Relative to screen height
            loop: true,
            duration: 500,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                width: screenWidth,
                height: screenHeight * 0.2, // Ensure responsive height
                decoration: BoxDecoration(
                  color: AppColors2.baseColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.all(screenWidth * 0.02), // Dynamic padding
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A look at outfits\nof the month",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AppColors2.brownColor,
                              fontSize:
                                  screenHeight * 0.03, // Dynamic font size
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.035,
                            width: screenWidth * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: AppColors2.baseWithOpacity),
                            child: Center(
                                child: Text(
                              "Buy now",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors2.brownColor),
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 4,
            layout: SwiperLayout.STACK,
          ),
        ),
      ),
    );
  }
}
