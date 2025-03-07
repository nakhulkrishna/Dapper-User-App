import 'dart:convert';
import 'dart:developer';

import 'package:dapper_user/data/models/auth/userModel.dart';
import 'package:dapper_user/utils/constants/keys/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Authenticationprovider {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final _loginUrl = Api.authUser;

  Future<AuthResponseModel> userSignUp(
      String username, String password, String email) async {
    try {
      final response = await http.post(
        Uri.parse("${_loginUrl}signup/"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'email': email,
        }),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] ==
            'OTP sent to email. Verify to complete registration.') {
          log("User created successfully");
          return AuthResponseModel.fromJson(jsonResponse);
        } else {
          throw Exception("Invalid signup credentials");
        }
      } else {
        throw Exception(
            "Invalid response from the server. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log('Error during signup: $e');
      throw Exception("An error occurred: $e");
    }
  }

  Future<AuthResponseModel> userSignIn(String username, String password) async {
    final reposnse = await http.post(
      Uri.parse("${_loginUrl}login/"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (reposnse.statusCode == 200) {
      final jsonResponse = jsonDecode(reposnse.body) as Map<String, dynamic>;
      log('Response body: ${reposnse.body}');
      if (jsonResponse['message'] == "User created successfully.") {
        log("user loggined");
        if (jsonResponse.containsKey('access_token')) {
          final accessCode = jsonResponse['access_token'];
          _saveToken(accessCode);
          log("Access code: $accessCode");
        } else {
          log("Access code not found in the response.");
        }

        return AuthResponseModel.fromJson(jsonResponse);
      } else {
        throw Exception("Invalid login credentials");
      }
    } else {
      throw Exception("Invalid response from the server");
    }
  }

  Future<AuthResponseModel> verifyOtp(
      String email, String otp, String username, String password) async {
    final response = await http.post(
      Uri.parse("${_loginUrl}otpverify/"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
        'otp': otp,
      }),
    );

    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['message'] == 'OTP verified successfully.') {
        log("OTP verification successful");
        return AuthResponseModel.fromJson(jsonResponse);
      } else {
        throw Exception("Invalid OTP or email.");
      }
    } else {
      throw Exception(
          "Failed to verify OTP. Invalid response from the server.");
    }
  }

  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: "auth_token", value: token);

    String? savedToken = await _secureStorage.read(key: "auth_token");
    if (savedToken != null) {
      log('Token saved successfully: $savedToken');
    } else {
      log('Failed to save token');
    }
  }

  Future<void> checkSavedToken() async {
    String? token = await getToken();
    if (token != null) {
      log('Token retrieved successfully: $token');
    } else {
      log('No token found');
    }
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: "auth_token");
  }

  Future<void> adminLogout() async {
    await _secureStorage.delete(key: "auth_token");
  }
}
