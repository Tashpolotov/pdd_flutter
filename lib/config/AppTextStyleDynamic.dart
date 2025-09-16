import 'package:flutter/material.dart';
import 'AppColors.dart';
import 'FontSize.dart';

class AppTextStyleDynamic {


  static TextStyle getTextStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    String fontFamily = 'MyCustomFont',
  }) {
    return TextStyle(
      fontSize: fontSize ,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle text_22_black_500 = getTextStyle(
    fontSize: FontSize.fs22,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle text_22_black_400 = getTextStyle(
    fontSize: FontSize.fs22,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle text_16_black_500 = getTextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle text_16_black_400 = getTextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle text_16_color_6E6E6E_400 = getTextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w400,
    color: AppColors.color_6E6E6E,
  );

  static TextStyle text_16_color_6E6E6E_500 = getTextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.color_6E6E6E,
  );

  static TextStyle text_12_color_A6A6A6_400 = getTextStyle(
    fontSize: FontSize.fs12,
    fontWeight: FontWeight.w400,
    color: AppColors.color_A6A6A6,
  );
}
