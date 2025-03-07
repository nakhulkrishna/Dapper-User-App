import 'dart:developer';
import 'package:dapper_user/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dapper_user/presentation/Authentication/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Method to check whether the user is already logged in by checking the stored token
  Future<void> _checkLoginStatus() async {
    try {
      // Await the result of reading from secure storage
      String? token = await _storage.read(key: 'auth_token');
      log('Retrieved token from storage: $token');

      // Wait for a few seconds before navigating (simulate a splash screen delay)
      await Future.delayed(const Duration(seconds: 3));

      // Navigate based on token existence
      if (token != null && token.isNotEmpty) {
        // If token exists, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyNavigationBar()),
        );
      } else {
        // No token, navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      }
    } catch (e) {
      log('Error reading token from storage: $e');
      // In case of any error, send the user to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change background color if needed
      body: Center(
        child: Image.asset(
          'assets/videos/Dapper.png',
          fit: BoxFit.contain,
        ), // Show your splash screen image here
      ),
    );
  }
}
