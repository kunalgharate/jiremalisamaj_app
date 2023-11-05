
import 'package:flutter/material.dart';

class CustomInputFormField extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final IconData? icon;

  CustomInputFormField({
    required this.hintText,
    this.errorText,
    this.icon,
  });
  @override
  _CustomInputFormFieldState createState() => _CustomInputFormFieldState();
}
class _CustomInputFormFieldState extends State<CustomInputFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.errorText,
        icon: widget.icon != null ? Icon(widget.icon) : null,
      ),
    );
  }
}