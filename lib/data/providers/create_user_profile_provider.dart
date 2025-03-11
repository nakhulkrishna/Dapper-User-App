import 'dart:developer';

import 'package:dapper_user/data/models/profile/profile_model.dart';
import 'package:dapper_user/utils/constants/keys/api.dart';
import 'package:dio/dio.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class CreateUserProfileProvider {
  final Dio dio;

  CreateUserProfileProvider({required this.dio});
  final addAddress = "https://f59c-202-164-149-48.ngrok-free.app/user/";
  Future<ProfileModel> createUserProfile(
    String fullname,
    String shopname,
    String mobile,
    int pincode,
    String place,
    String district,
    String city,
    String token,
  ) async {
    try {
      final response = await dio.post(
        "https://f59c-202-164-149-48.ngrok-free.app/user/add_address/",
        data: {
          'full_name': fullname,
          'shop_name': shopname,
          'mobile': mobile,
          'pincode': pincode,
          'place': place,
          'district': district,
          'city': city,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        log("user created done!");
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception('User not created$response');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('User not created $e');
    }
  }
}
