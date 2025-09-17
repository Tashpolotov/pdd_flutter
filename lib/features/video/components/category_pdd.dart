import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';

import '../../../models/video/CategoryModel.dart';

class CategoryPdd extends StatelessWidget {
  final CategoryModel categoryModel;
  final Function(int subcategoryId)? onSubcategoryTap;

  const CategoryPdd({
    super.key,
    required this.categoryModel,
    this.onSubcategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryModel.title,
          style: AppTextStyle.text_16_color_6E6E6E_500,
        ),
        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: categoryModel.subcategories.length,
            itemBuilder: (context, index) {
              final sub = categoryModel.subcategories[index];
              return GestureDetector(
                onTap: () => onSubcategoryTap?.call(sub.id),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          sub.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        sub.title,
                        style: AppTextStyle.text_12_black_500,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
