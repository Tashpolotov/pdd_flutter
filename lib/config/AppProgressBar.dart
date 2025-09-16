import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProgressbar extends StatelessWidget {
  const AppProgressbar({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return SizedBox.shrink();
    return Stack( // Используем Stack для перекрытия всего экрана
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.5), // Затемнение фона
          dismissible: false, // Предотвращает закрытие при касании
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

class AppProgressBarWrapper extends StatefulWidget {
  final Widget child;

  const AppProgressBarWrapper({super.key, required this.child});

  @override
  _AppProgressBarWrapperState createState() => _AppProgressBarWrapperState();

  static _AppProgressBarWrapperState? of(BuildContext context) {
    return context.findAncestorStateOfType<_AppProgressBarWrapperState>();
  }
}

class _AppProgressBarWrapperState extends State<AppProgressBarWrapper> {
  bool _isLoading = false;

  void showLoading() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void hideLoading() {
    if (_isLoading) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AppProgressbar(isLoading: _isLoading),
      ],
    );
  }

  static _AppProgressBarWrapperState? of(BuildContext context) {
    return context.findAncestorStateOfType<_AppProgressBarWrapperState>();
  }
}