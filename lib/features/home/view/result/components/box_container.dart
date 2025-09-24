import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/AppColors.dart';
import '../../../../../config/AppTextStyle.dart';
import '../../../../../gen/assets.gen.dart';

class BoxContainer extends StatelessWidget {
  final String ball;
  final String name;
  const BoxContainer({super.key, required this.ball, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 2, color: AppColors.btnColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 6,
          ),
          child: Column(
            children: [
              Text(name, style: AppTextStyle.text_14_black_500,),
              SizedBox(height: 8.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.images.icStar.path),
                  SizedBox(width: 6.w),
                  Text(ball, style: AppTextStyle.text_20_black_500),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
