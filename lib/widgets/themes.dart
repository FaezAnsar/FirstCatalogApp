import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{

  static ThemeData light(BuildContext context)=>ThemeData(
primarySwatch: Colors.green,
      textTheme:Theme.of(context).textTheme, 
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(color: Colors.white
      ,elevation: 0,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color:Colors.black),
  ));

  static ThemeData dark (BuildContext context ) => ThemeData(
    
        brightness: Brightness.dark,
      );
  
}