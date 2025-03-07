import 'dart:developer';

import 'package:dapper_user/data/models/auth/userModel.dart';
import 'package:dapper_user/data/providers/authentication_provider.dart';

class Authrepos {
  final Authenticationprovider _authProvider;

  Authrepos(this._authProvider);
//* user sign up
  Future<AuthResponseModel> userSignUp(
      String username, String password, String email) async {
    try {
      final response =
          await _authProvider.userSignUp(username, password, email);
      if (response.message ==
          "OTP sent to email. Verify to complete registration.") {
        return response;
      } else {
        throw Exception('Signup failed: ${response.message}');
      }
    } catch (e, stack) {
      log('Signup failed with error: $e', stackTrace: stack);
      throw Exception('Signup failed: $e');
    }
  }

//* user sign in
  Future<AuthResponseModel> userSignIn(
    String username,
    String password,
  ) async {
    try {
      final response = await _authProvider.userSignIn(username, password);
      if (response.message == "User created successfully.") {
        // _saveToken(response.access!);

        return response;
      } else {
        throw Exception('Invalid login response');
      }
    } catch (e) {
      log('Login failed with error: $e');
      throw Exception('Login failed: $e');
    }
  }

//* otp verifications
  Future<AuthResponseModel> verifyOtp(
      String email, String otp, String username, String password) async {
    try {
      final response =
          await _authProvider.verifyOtp(email, otp, username, password);
      if (response.message == "OTP verified successfully.") {
        return response;
      } else {
        throw Exception('OTP verification failed: ${response.message}');
      }
    } catch (e, stack) {
      log('OTP verification failed with error: $e', stackTrace: stack);
      throw Exception('OTP verification failed: $e');
    }
  }
}
