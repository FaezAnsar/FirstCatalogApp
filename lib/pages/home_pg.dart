import 'package:flutter/material.dart';
import 'package:hindi_course/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  
  final int days =30;
  final String name = "Codepur";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child:Container(
        child: Text("Welcome to $days days of fluter by $name"),
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
