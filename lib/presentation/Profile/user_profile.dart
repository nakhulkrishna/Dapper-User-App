import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/common/widgets/custom_scaffold.dart';
import 'package:dapper_user/presentation/Profile/edit_profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolor.color2,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align to right
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.poppins(
                            color: Appcolor.whiteColor,
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: screenWidth * 0.08,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jayadom Mango",
                                style: GoogleFonts.poppins(
                                    color: Appcolor.whiteColor,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "+91 8923092365",
                                style: GoogleFonts.poppins(
                                  fontSize: screenHeight * 0.015,
                                  color: Appcolor.whiteColor,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "Account Details",
                            style: GoogleFonts.poppins(),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfile(),
                                    ));
                              },
                              icon: Icon(EvaIcons.edit2Outline))
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Container(
                        height: screenHeight * 0.2,
                        width: screenWidth,
                        decoration: BoxDecoration(
                            color: AppColors2.baseColor.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shop Profile",
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                "Shop Name : Espanshe",
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                "India / Kerala / Kottakel / Collage Street / 676302",
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                "Contact  : +91 8923092365",
                                style: GoogleFonts.poppins(),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
