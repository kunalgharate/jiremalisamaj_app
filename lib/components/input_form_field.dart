
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomInputFormField extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomInputFormField({
    required this.hintText,
    this.errorText,
    this.icon,
    this.onChanged,
    this.controller,
    this.validator,
  });

  @override
  _CustomInputFormFieldState createState() => _CustomInputFormFieldState();
}

class _CustomInputFormFieldState extends State<CustomInputFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white54,
        filled: true,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(widget.icon), // Email Icon
      ),

      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}

