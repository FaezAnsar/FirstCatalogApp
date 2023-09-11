import "package:flutter/material.dart";
import "home_pg.dart";


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
      home: HomePage(),
    );
  }
}