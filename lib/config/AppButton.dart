import 'package:flutter/material.dart';
import 'AppColors.dart';
import 'AppTextStyle.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const AppButton({super.key, required this.buttonText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            buttonText,
            style: AppTextStyle.text_16_color_6E6E6E_400.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


