import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppButton.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';

import '../../../../../gen/assets.gen.dart';

class BottomSheetAnswer extends StatelessWidget {
  final String statusText;
  final String title;
  final String buttonText;

  const BottomSheetAnswer({
    super.key,
    required this.statusText,
    required this.title,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                SvgPicture.asset(Assets.images.icStar.path),
                SizedBox(width: 20),
                Text(statusText, style: AppTextStyle.text_16_color_6E6E6E_500),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: AppTextStyle.text_12_color_A6A6A6_400,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 70.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.color_red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(buttonText: buttonText, onClick: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
