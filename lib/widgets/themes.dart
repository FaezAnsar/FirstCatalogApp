import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTheme {
  static ThemeData light(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      focusColor: darkBluishColor,
      highlightColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
       
      ));

  static ThemeData dark(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      focusColor: lightBluishColor,
      highlightColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        
            ),
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Color(0xff163057);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color(0xff605d7b);
}