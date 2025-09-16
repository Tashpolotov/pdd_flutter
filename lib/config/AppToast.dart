import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void show({
    required String message,
    ToastGravity? gravity,
    Toast? length,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 12,
      backgroundColor: backgroundColor ?? Colors.white,
      textColor: textColor ?? Colors.black87,
      fontSize: fontSize ?? 22.0,
    );
  }

  static void showSuccess(String message) {
    show(
      message: message,
      backgroundColor: Colors.green.shade400,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
      length: Toast.LENGTH_LONG,
    );
  }

  static void showError(String message) {
    show(
      message: message,
      backgroundColor: Colors.red.shade400,
      textColor: Colors.white,
    );
  }

  static void showInfo(String message) {
    show(
      message: message,
      backgroundColor: Colors.blue.shade400,
      textColor: Colors.white,
    );
  }
}