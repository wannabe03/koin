import 'package:flutter/material.dart';

TextTheme koinTextTheme(BuildContext context) {
  // final screenWidth = MediaQuery.of(context).size.width;
  // const designWidth = 375.0;

  // double scaledSize(double size) => size;
  // double scaledLetterSpacing(double fontSize, double percentage) =>
  // fontSize * percentage;

  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: 48,
      letterSpacing: 48 * -0.02,
    ),
    displayMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 32,
      letterSpacing: 32 * -0.02,
    ),
    displaySmall: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: 24 * -0.05,
    ),
    headlineLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 24 * -0.02,
    ),
    headlineMedium: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w400,
      fontSize: 20,
      letterSpacing: 20 * -0.02,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 20 * -0.02,
    ),
    titleLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 16,
      letterSpacing: 16 * -0.02,
    ),
    titleMedium: TextStyle(
      fontFamily: "GapyeongHanseokbong",
      fontWeight: FontWeight.w700,
      fontSize: 14,
      letterSpacing: 14 * -0.02,
    ),
    titleSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 14 * -0.02,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // default: 24, override: 20
      height: 24 / 16,
      letterSpacing: 16 * -0.02,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 14 * -0.02,
    ),
    bodySmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 11,
      letterSpacing: 0,
    ),
    labelLarge: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 12 * -0.02,
    ),
    labelMedium: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w700,
      fontSize: 10,
      letterSpacing: 10 * -0.02,
    ),
    labelSmall: TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: 8,
      letterSpacing: 8 * 0.05,
    ),
  );
}
