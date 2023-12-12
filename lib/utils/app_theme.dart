import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: AppColors.primary.toMaterialColor(),
      fontFamily: GoogleFonts
          .lato()
          .fontFamily,
      unselectedWidgetColor: Colors.white,
      primaryColor: Colors.white,
      hintColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.white54,
      scaffoldBackgroundColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.red, // Set the cursor color here
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          // Set the color for focused state
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          // Set the color for error state
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          // Set the color for unfocused state
          borderRadius: BorderRadius.circular(30.0),
        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 25),
        labelStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        // Other properties as needed
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(AppColors.primary),
        overlayColor: MaterialStateProperty.all(Colors.white),
      ),
      primaryTextTheme: GoogleFonts.latoTextTheme(TextTheme(
          titleMedium:
          GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)))),
      textTheme: TextTheme(
          titleMedium:
          GoogleFonts.lato(textStyle: TextStyle(color: Colors.white))));


  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: AppColors.primary.toMaterialColor(),
    fontFamily: GoogleFonts
        .lato()
        .fontFamily,
    unselectedWidgetColor: Colors.white54,
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    hintColor: Colors.white,
    dividerColor: Colors.black12,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        // Set the color for focused state
        borderRadius: BorderRadius.circular(30.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        // Set the color for error state
        borderRadius: BorderRadius.circular(30.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
        // Set the color for unfocused state
        borderRadius: BorderRadius.circular(30.0),
      ),
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
      labelStyle: const TextStyle(color: Colors.white),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      // Other properties as needed
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(AppColors.primary),
      overlayColor: MaterialStateProperty.all(Colors.white),
    ),
    primaryTextTheme: GoogleFonts.latoTextTheme(TextTheme(
      titleMedium: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
    )),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
    ),
  );

  // phone picker theme

  // static PickerDialogStyle pickerDialogStyle =PickerDialogStyle(countryNameStyle: GoogleFonts.lato(color: Colors.black),
  //     searchFieldInputDecoration: InputDecoration(
  //       focusedBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.black), // Set the border color for focused state
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.grey), // Set the border color for unfocused state
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       filled: true,
  //       fillColor: Colors.white, // Set the fill color
  //       floatingLabelBehavior: FloatingLabelBehavior.never,
  //       hintStyle: TextStyle(color: Colors.black), // Set the hint color
  //       labelStyle: TextStyle(color: Colors.black), // Set the hint color
  //       contentPadding: EdgeInsets.symmetric(horizontal: 25),
  //       errorStyle: TextStyle(
  //         color: Colors.red,
  //         fontWeight: FontWeight.w500,
  //         fontSize: 15,
  //       ),
  //       // Additional properties as needed
  //       labelText: 'Search country', // Replace with your label text
  //       hintText: 'Search country', // Replace with your hint text
  //     ));


  static InputDecoration textFormFieldDecoration = InputDecoration(
    labelText: 'Label',
    hintText: 'Hint',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      // Set the color for focused state
      borderRadius: BorderRadius.circular(30.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      // Set the color for unfocused state
      borderRadius: BorderRadius.circular(30.0),
    ),
    filled: false,
    fillColor: Colors.white,
    // Set the fill color
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintStyle: TextStyle(color: Colors.black),
    // Set the hint color
    contentPadding: EdgeInsets.symmetric(horizontal: 25),
  );

  static TextStyle normalBlackTextTheme = GoogleFonts.ubuntu(color: AppColors.blackColor,fontSize: 16,fontWeight: FontWeight.w400);
  static TextStyle normalOrangeTextTheme = GoogleFonts.ubuntu(color: AppColors.primary,fontSize: 16,fontWeight: FontWeight.w400);

}
