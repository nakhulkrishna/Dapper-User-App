import 'package:dapper_user/app.dart';
import 'package:dapper_user/presentation/Authentication/forget_passsword_screen.dart';
import 'package:dapper_user/presentation/Authentication/otpScreen.dart';
import 'package:dapper_user/presentation/Authentication/signin_screen.dart';

import 'package:dapper_user/presentation/homeScreen/homeScreen.dart';
import 'package:dapper_user/presentation/splashScreen/splash_screen.dart';

import 'package:flutter/material.dart';

//* Define the routes for the app
class AppRouter {
  static const String splash = "/";
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String verification = '/verification';
  static const String home = '/home';
  static const String mynavigation = "/mynavigation";
  static const String singleProducts = "/singleProducts";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case mynavigation:
        return MaterialPageRoute(builder: (_) => MyNavigationBar());
      case login:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());

      case verification:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) {
            return EmailVerification(
              email: args['email'],
              username: args['username'],
              password: args['password'],
            );
          },
        );
      case home:
        return MaterialPageRoute(builder: (_) => Homescreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
