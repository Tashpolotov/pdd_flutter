import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';

import '../../../gen/assets.gen.dart';

class LessonComplete extends StatelessWidget {
  final String ball;
  final String nameBall;
  final String imgConst;
  final bool isLoading;

  const LessonComplete({
    required this.ball,
    required this.nameBall,
    required this.imgConst,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          SvgPicture.asset(imgConst),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ball,
                  style: AppTextStyle.text_16_gold_400,
                ),
                Text(
                  nameBall,
                  style: AppTextStyle.text_12_color_A6A6A6_400,
                ),
              ],
            ),
          ),
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
    );
  }
}