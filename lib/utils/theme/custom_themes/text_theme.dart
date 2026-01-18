import 'package:flutter/material.dart';

class TTextTheme{
  TTextTheme._();

static TextTheme lightTextTheme =  TextTheme(
  // 32
  headlineLarge: TextStyle().copyWith(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),

  // 24
  headlineMedium: TextStyle().copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),

  // 18
  headlineSmall: TextStyle().copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),

  // 16 - semibold
  titleLarge: TextStyle().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),

  // 16 - medium
  titleMedium: TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),

  // 16 - regular
  titleSmall: TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),

  // 14 - medium
  bodyLarge: TextStyle().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),

  // 14 - normal
  bodyMedium: TextStyle().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),

  // 14 - faded
  bodySmall: TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.5),
  ),

  // 12
  labelLarge: TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),

  // 12 - faded
  labelMedium: TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(0.5),
  ),
);


  static TextTheme darkTextTheme = TextTheme(
  // 32
  headlineLarge: TextStyle().copyWith(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),

  // 24
  headlineMedium: TextStyle().copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),

  // 18
  headlineSmall: TextStyle().copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),

  // 16 - semibold
  titleLarge: TextStyle().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),

  // 16 - medium
  titleMedium: TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),

  // 16 - regular
  titleSmall: TextStyle().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),

  // 14 - medium
  bodyLarge: TextStyle().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),

  // 14 - normal
  bodyMedium: TextStyle().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),

  // 14 - faded
  bodySmall: TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.5),
  ),

  // 12
  labelLarge: TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),

  // 12 - faded
  labelMedium: TextStyle().copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white.withOpacity(0.5),
  ),
);

}