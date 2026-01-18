import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: Colors.black),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    selectedColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    labelStyle: TextStyle(color: Colors.black),
    checkmarkColor: Colors.white,
  );
}