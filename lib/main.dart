import "package:flutter/material.dart";
import 'package:hindi_course/pages/loginPage.dart';
import 'pages/home_pg.dart';
import 'package:google_fonts/google_fonts.dart';


void main()
{
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget
{
  const FirstApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.green,
      fontFamily: GoogleFonts.lato().fontFamily),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes:{
        "/":(context)=>LoginPage(),
        "/home":(context)=>HomePage(),
        "/login":(context)=>LoginPage()
      }
    );
  }
}