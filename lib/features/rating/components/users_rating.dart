import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';
import '../../../gen/assets.gen.dart';

class UsersRating extends StatelessWidget {
  final RankModel rankModel;
  final int position;
  final bool isCurrentUser;

  const UsersRating({
    super.key,
    required this.rankModel,
    required this.position,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _getBorderColor(position, isCurrentUser),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _getPositionColor(position),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                position.toString(),
                style: AppTextStyle.text_14_black_500,
              ),
            ),
          ),
          const SizedBox(width: 12),

          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.irisBlue.withOpacity(0.2),
            child:
                rankModel.image.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        rankModel.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SvgPicture.asset(
                            Assets.images.imgEnotProfile.path,
                            width: 24,
                            height: 24,
                          );
                        },
                      ),
                    )
                    : SvgPicture.asset(
                      Assets.images.imgEnotProfile.path,
                      width: 24,
                      height: 24,
                    ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rankModel.user,
                  style: AppTextStyle.text_16_black_500,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  rankModel.rank,
                  style: AppTextStyle.text_16_black_500,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Пройдено уроков: ${rankModel.completeLesson}',
                  style: AppTextStyle.text_12_black_500,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.images.icStar.path,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                rankModel.totalPoints.toString(),
                style: AppTextStyle.text_16_black_400,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getPositionColor(int position) {
    switch (position) {
      case 1:
        return const Color(0xFFFFD700);
      case 2:
        return const Color(0xFFC0C0C0);
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return AppColors.irisBlue;
    }
  }

  Color _getBorderColor(int position, bool isCurrentUser) {
    if (isCurrentUser) {
      return AppColors.btnColor;
    }

    switch (position) {
      case 1:
        return AppColors.btnColor;
      case 2:
        return AppColors.grey;
      case 3:
        return AppColors.color_red;
      default:
        return Colors.transparent;
    }
  }
}
