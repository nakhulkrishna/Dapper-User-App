import 'dart:developer';

import 'package:dapper_user/data/models/profile/profile_model.dart';
import 'package:dapper_user/utils/constants/keys/api.dart';
import 'package:dio/dio.dart';

class CreateUserProfileProvider {
  final Dio dio;

  CreateUserProfileProvider({required this.dio});
  final addAddress = Api.authUser;

  Future<ProfileModel> createUserProfile(
    String fullname,
    String shopname,
    int mobile,
    int pincode,
    String place,
    String district,
    String city,
  ) async {
    try {
      final response = await dio.post(
        "${addAddress}add_address/",
        data: {
          'fullname': fullname,
          'shopname': shopname,
          'mobile': mobile.toString(),
          'pincode': pincode.toString(),
          'place': place,
          'district': district,
          'city': city,
        },
      );

      if (response.statusCode == 400) {
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
