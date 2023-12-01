import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  Function onPress;
  String buttonText;
  bool isLoading;
  bool isDisabled;

  CustomButton(
      {Key? key,
      required this.onPress,
      required this.buttonText,
      this.isLoading = false,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isDisabled || isLoading ? null: onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
          blurRadius: 5.0,
                color: AppColors.primary.withOpacity(0.5), //New

          ),],
          color: isDisabled || isLoading
                ? AppColors.primary.withOpacity(0.4):AppColors.primary,
            border: Border.all(
              color: isDisabled || isLoading
                  ? AppColors.primary.withOpacity(0.4):AppColors.primary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            isLoading ? "Loading ..." : buttonText,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
