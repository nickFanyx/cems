import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    scrollbarTheme: ScrollbarThemeData(),
    fontFamily: "Poppins",
    // dialogTheme: dialogTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecoration(),
    //brightness: Brightness.dark,
    primaryColor: Colors.redAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.redAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: TextStyle(
          fontSize: 12,
        ),
        // side: BorderSide(color: kPrimaryColor),
      ),
    ),
  );
}

dialogTheme() {
  return Container();
}

//setup design for input box
InputDecorationTheme inputDecoration() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.grey.shade800),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 15),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      fillColor: Colors.white,
      filled: true);
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  );
}

//setup design for app bar
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.redAccent,
    elevation: 0,
    centerTitle: true,
  );
}
