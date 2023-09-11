import "package:flutter/material.dart";
import 'package:hindi_course/pages/loginPage.dart';
import 'pages/home_pg.dart';


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
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes:{
        "/":(context)=>LoginPage(),
        "/home":(context)=>HomePage(),
        "/login":(context)=>LoginPage()
      }
    );
  }
}