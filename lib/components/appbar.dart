import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
AppBar headAppbar(BuildContext context, String title, bool isTitleVisible) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black87,
      ),
    ),
    title: isTitleVisible
        ? Text(
      title,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
          )
        : null,
    backgroundColor: Colors.white,
    elevation: 0.0, // 1 ,
    titleSpacing: 0.0,

  );
}
