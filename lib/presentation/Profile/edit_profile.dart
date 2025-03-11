import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/logic/bloc/user_profile_bloc.dart';
import 'package:dapper_user/logic/bloc/user_profile_event.dart';
import 'package:dapper_user/logic/bloc/user_profile_state.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Text editing controllers for the form fields
    TextEditingController ownerName = TextEditingController();
    TextEditingController shopName = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController pincode = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController district = TextEditingController();
    TextEditingController city = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileSuccess) {
          // Show success message when profile update is successful
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully!')),
          );
        } else if (state is UserProfileFailure) {
          // Show error message when profile update fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update profile!')),
          );
        }
      },
      child: Scaffold(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                // Dispatch the CreateUserProfile event when save is clicked
                                context.read<UserProfileBloc>().add(
                                      CreateUserProfileEvent(
                                        fullname: ownerName.text,
                                        shopname: shopName.text,
                                        mobile: phoneNumber.text,
                                        pincode: int.parse(pincode.text),
                                        place: state.text,
                                        district: district.text,
                                        city: city.text,
                                      ),
                                    );
                              },
                              icon: Icon(
                                Iconsax.save_2,
                                color: AppColors2.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: ownerName,
                          label: 'Owner Name',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: shopName,
                          label: 'Shop Name',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: phoneNumber,
                          label: 'Phone Number',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: pincode,
                          label: 'Pincode',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: state,
                          label: 'State',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: district,
                          label: 'District',
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        text_field(
                          controller: city,
                          label: 'City',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class text_field extends StatelessWidget {
  const text_field({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(),
        ),
        TextFormField(
          controller: controller,
          cursorColor: Appcolor.blackColor,
          decoration: InputDecoration(
            focusedBorder:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }
}
