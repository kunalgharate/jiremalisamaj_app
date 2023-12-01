import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final String? type;
  final ValueChanged<String>? onChanged;
  String? saveValue;
  Function? validate;
  String initialValue='';

  InputField(
      {Key? key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.type,
      this.validate,
      this.initialValue='',
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        textInputAction: TextInputAction.done,
        keyboardType: type == AppString.NUMBER
            ? TextInputType.number
            : type == AppString.EMAIL
                ? TextInputType.emailAddress
                : TextInputType.text,
        obscureText: type == AppString.PASSWORD ? true : false,
        initialValue: initialValue,
        onChanged: onChanged,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hintText,
          hintText: hintText,
        ),
        validator: (input) => validate!(input!),
        onSaved: (input) => saveValue = input,
      ),
    );
  }
}
