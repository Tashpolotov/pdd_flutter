import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppButton.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/config/appbar_custom.dart';
import 'package:pdd_flutter_new_24_04_25/features/home/view/result/components/box_container.dart';

import '../../../../../gen/assets.gen.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppbarCustom(titleAppBar: "Результат"),
      body: _buildContent(),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildStarsSection(),
        SizedBox(height: 16.h),
        _buildStatistics(),
      ],
    );
  }

  Widget _buildStarsSection() {
    return Stack(
      children: [
        Positioned(
          top: 130.h,
          right: 42.w,
          child: SvgPicture.asset(
            Assets.images.icReusltStar.path,
            width: 56.w,
            height: 56.h,
          ),
        ),
        Positioned(
          top: 190.h,
          left: 24.w,
          child: SvgPicture.asset(
            Assets.images.icReusltStar.path,
            width: 36.w,
            height: 36.h,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.images.icReusltStar.path,
                  width: 48.w,
                  height: 48.h,
                ),
                SizedBox(height: 20),
                Image.asset(
                  Assets.images.imgEnitResult.path,
                  width: 117.w,
                  height: 142.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 32.h),
                Text(
                  "Урок пройден!",
                  style: AppTextStyle.text_22_black_500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          BoxContainer(ball: "40", name: "Баллы"),
          BoxContainer(ball: "22:2", name: "Быстро"),
          BoxContainer(ball: "100", name: "Идеально"),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            buttonText: "Попробовать снова",
            backgroundColor: AppColors.white,
            textColor: AppColors.grey,
            onClick: () {},
          ),
          SizedBox(height: 12.h),
          AppButton(buttonText: "Продолжить", onClick: () {}),
        ],
      ),
    );
  }
}
