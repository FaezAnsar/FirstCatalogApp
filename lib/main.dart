import "package:flutter/material.dart";
import 'package:hindi_course/pages/cart_page.dart';


import 'package:hindi_course/pages/loginPage.dart';
import 'package:hindi_course/utilities/routes.dart';
import 'package:hindi_course/widgets/themes.dart';
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
      
      themeMode: ThemeMode.system,
      
      theme: MyTheme.light(context),
      
      darkTheme: MyTheme.dark(context),
      //initialRoute: MyRoutes.loginRoute,
      routes:{
        "/":(context)=>HomePage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
        MyRoutes.cartRoute:(context)=>CartPage(),
        

      }
    );
  }
}