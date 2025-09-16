import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final int? maxLength;
  final bool autofocus;

  const AppTextfield({
    super.key,
    required this.label,
    required this.controller,
    required this.inputType,
    required this.obscureText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    this.autofocus = false,
  });

  @override
  _AppTextfieldState createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
