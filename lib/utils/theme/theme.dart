import 'package:cartify/utils/theme/custom_themes/appbar_theme.dart';
import 'package:cartify/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:cartify/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:cartify/utils/theme/custom_themes/chip_theme.dart';
import 'package:cartify/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:cartify/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:cartify/utils/theme/custom_themes/text_field_theme.dart';
import 'package:cartify/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
   //light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightTextFormFieldTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: TChipTheme.lightChipTheme,

  );


  // Dark Theme

  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: TChipTheme.darkChipTheme,

  );
}
