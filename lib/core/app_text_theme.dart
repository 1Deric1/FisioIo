part of 'app_theme.dart';

class TextAppTheme {
  static TextStyle get filledInputTextStyle => TextStyle(
        fontSize: 20,
        color: AppTheme.blackColor,
      );
  static TextStyle get labelWhiteTextStyle => TextStyle(
        fontSize: 12,
        color: AppTheme.whiteColor,
      );
  static TextStyle get labelErrorTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.redColor,
      );
}
