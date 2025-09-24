import 'package:flutter/material.dart';

enum BottomSheetType {
  lesson,
  test,
  info,
  error,
}

class AppBottomSheet {
  static void show(
      BuildContext context, {
        required String message,
        String? actionLabel,
        VoidCallback? onAction,
        Color? backgroundColor,
        BottomSheetType type = BottomSheetType.info,
      }) {
    final Color sheetColor = backgroundColor ??
            () {
          switch (type) {
            case BottomSheetType.lesson:
              return const Color(0xFF1FB0C8);
            case BottomSheetType.test:
              return const Color(0xFFFF6B35);
            case BottomSheetType.error:
              return Colors.red;
            default:
              return Colors.grey[900]!;
          }
        }();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          decoration: BoxDecoration(
            color: sheetColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16)
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (actionLabel != null) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      onAction?.call();
                    },
                    child: Text(actionLabel),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
