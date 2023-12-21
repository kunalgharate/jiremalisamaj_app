
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomPasswordInputFormField extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomPasswordInputFormField({
    required this.hintText,
    this.errorText,
    this.icon,
    this.onChanged,
    this.controller,
    this.validator,
  });

  @override
  _CustomPasswordInputFormFieldState createState() =>
      _CustomPasswordInputFormFieldState();
}

class _CustomPasswordInputFormFieldState
    extends State<CustomPasswordInputFormField> {
  bool passwordVisible = false;

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
        prefixIcon: Icon(widget.icon), // Password Icon
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
      obscureText: !passwordVisible,
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}