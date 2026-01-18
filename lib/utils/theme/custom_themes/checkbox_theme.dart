import 'package:flutter/material.dart';


class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),

  checkColor: WidgetStateProperty.resolveWith<Color>(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.black;
    },
  ),

  fillColor: WidgetStateProperty.resolveWith<Color>(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      }
      return Colors.transparent;
    },
  ),
 );

 // For dark theme, you can customize it similarly

  static CheckboxThemeData darkCheckboxTheme =CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  ),

  checkColor: WidgetStateProperty.resolveWith<Color>(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      return Colors.black;
    },
  ),

  fillColor: WidgetStateProperty.resolveWith<Color>(
    (states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      }
      return Colors.transparent;
    },
  ),
);


}