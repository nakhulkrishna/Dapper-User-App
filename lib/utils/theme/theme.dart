import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

ThemeData lightMode = ThemeData(
  checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: AppColors2.baseWithOpacity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      checkColor: WidgetStatePropertyAll(Appcolor.whiteColor)),
  scaffoldBackgroundColor: Appcolor.whiteColor,
  appBarTheme: AppBarTheme(
      backgroundColor: Appcolor.whiteColor,
      surfaceTintColor: Appcolor.whiteColor),
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  snackBarTheme: SnackBarThemeData(backgroundColor: Appcolor.blackColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust the corner radius
        ),
        maximumSize: Size(double.infinity, 56),
        elevation: 0,
        backgroundColor: Appcolor.blackColor,
        foregroundColor: Appcolor.whiteColor),
  ),
);

ThemeData darkMode = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Appcolor.blackColor,
        foregroundColor: Appcolor.whiteColor),
  ),
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
