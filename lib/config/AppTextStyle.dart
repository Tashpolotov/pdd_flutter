import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';
import 'FontSize.dart';


class AppTextStyle {
  static const String _fontFamily = 'MyCustomFont';

  static const TextStyle text_22_black_500 = TextStyle(
    fontSize: FontSize.fs22,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_20_black_500 = TextStyle(
    fontSize: FontSize.fs20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_18_black_500 = TextStyle(
    fontSize: FontSize.fs18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_16_black_500 = TextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_14_black_500 = TextStyle(
    fontSize: FontSize.fs14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_12_black_500 = TextStyle(
    fontSize: FontSize.fs12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: _fontFamily,
  );


  static const TextStyle text_22_black_400 = TextStyle(
    fontSize: FontSize.fs22,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_16_black_400 = TextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_16_color_6E6E6E_400 = TextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w400,
    color: AppColors.color_6E6E6E,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_16_color_6E6E6E_500 = TextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.color_6E6E6E,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_12_color_A6A6A6_400 = TextStyle(
    fontSize: FontSize.fs12,
    fontWeight: FontWeight.w400,
    color: AppColors.color_A6A6A6,
    fontFamily: _fontFamily,
  );

  static const TextStyle text_16_gold_400 = TextStyle(
    fontSize: FontSize.fs16,
    fontWeight: FontWeight.w400,
    color: AppColors.btnColor,
    fontFamily: _fontFamily,
  );
}
