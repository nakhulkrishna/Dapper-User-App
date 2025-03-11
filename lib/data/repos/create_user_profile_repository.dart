import 'dart:developer';

import 'package:dapper_user/data/models/profile/profile_model.dart';
import 'package:dapper_user/data/providers/create_user_profile_provider.dart';

class CreateUserProfileRepository {
  final CreateUserProfileProvider userProfileProvider;

  CreateUserProfileRepository({required this.userProfileProvider});

  Future<ProfileModel> createProfile(
    String ownerName,
    String shopName,
    String phoneNumber,
    int pincode,
    String place,
    String district,
    String city,
    String token,
  ) async {
    try {
      final response = await userProfileProvider.createUserProfile(ownerName,
          shopName, phoneNumber, pincode, place, district, city, token);
      return response;
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception("Failed to create profile");
    }
  }
}
