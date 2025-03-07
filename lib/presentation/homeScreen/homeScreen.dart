import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _secureStorage = FlutterSecureStorage();
    // Get the screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<String> images = [
      'assets/videos/shirt.jpg',
      'assets/videos/Tshitrs.jpg',
      'assets/videos/jeans.jpg',
      'assets/videos/pants.jpg',
      'assets/videos/shorts.jpg',
    ];

    final List<String> names = [
      'Shirt',
      'T-Shirts',
      'Jeans',
      'Pants',
      'Shorts',
    ];

    return Scaffold(
      backgroundColor: Appcolor.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          surfaceTintColor: Appcolor.whiteColor,
          backgroundColor: Appcolor.whiteColor,
          title: Text(
            "DAPPER",
            style: GoogleFonts.playfair(
                fontSize: screenHeight * 0.04, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await _secureStorage.delete(key: 'auth_token');
                },
                icon: Icon(Iconsax.notification_1))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal scroll list
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              child: Container(
                height: screenHeight * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                      child: Container(
                        width: screenWidth * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolor.whiteColor,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                width: screenWidth * 0.43,
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.01,
                              top: screenHeight * 0.18,
                              child: Container(
                                width: screenWidth * 0.27,
                                height: screenHeight * 0.04,
                                decoration: BoxDecoration(
                                  color: Appcolor.blackColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    names[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenHeight * 0.02,
                                        color: Appcolor.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: screenWidth * 0.32,
                              top: screenHeight * 0.18,
                              child: Container(
                                width: screenWidth * 0.1,
                                height: screenHeight * 0.04,
                                decoration: BoxDecoration(
                                  color: Appcolor.color1,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Iconsax.arrow_right_1),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Poster image
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.015,
                  vertical: screenHeight * 0.015),
              child: Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Appcolor.color1,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/videos/poster.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Popular Items Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Popular Items",
                        style: GoogleFonts.gentiumBookPlus(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.03),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: GoogleFonts.gentiumBookPlus(
                              fontSize: screenHeight * 0.02),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.22,
                    decoration: BoxDecoration(
                      color: Appcolor.color1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/videos/1600w-lYcbGpUSVGo.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
