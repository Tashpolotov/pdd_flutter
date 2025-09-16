import 'package:flutter/material.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';

import '../generated/l10n.dart';

class NameInputDialog extends StatefulWidget {
  final void Function(String name) onDone;
  final VoidCallback onCancel;

  const NameInputDialog({
    super.key,
    required this.onDone,
    required this.onCancel,
  });

  @override
  State<NameInputDialog> createState() => _NameInputDialogState();
}

class _NameInputDialogState extends State<NameInputDialog> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final isNotEmpty = _controller.text.trim().isNotEmpty;
      if (_isButtonEnabled != isNotEmpty) {
        setState(() {
          _isButtonEnabled = isNotEmpty;
        });
      }
    });

    // Устанавливаем фокус на поле ввода после открытия диалога
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.levelColorBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Введите имя',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: widget.onCancel,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.btnColor,
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(S.of(context)!.cansel,),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                widget.onDone(_controller.text.trim());
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnColor,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.grey,
                disabledForegroundColor: Colors.white.withOpacity(0.8),
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(S.of(context)!.complete),
            ),
          ],
        ),
      ),
    );
  }
}
