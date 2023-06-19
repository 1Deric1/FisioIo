import 'package:flutter/material.dart';

part 'app_text_theme.dart';

class AppTheme {
  static Color get whiteColor => Colors.white;
  static Color get redColor => Colors.red;
  static Color get blackColor => Colors.black;
  static Color get primaryColor => const Color.fromARGB(255, 205, 207, 55);
  static Color get iconColor => Colors.blueGrey;
  static Color get complementarColor => const Color.fromARGB(255, 38, 14, 43);
  static InputDecoration get filledInputDecoration {
    return InputDecoration(
      fillColor: whiteColor,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      border: const OutlineInputBorder(),
      hintStyle: TextAppTheme.filledInputTextStyle,
    );
  }
}
