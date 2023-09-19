import 'package:flutter/material.dart';
import 'package:hindi_course/models/catalog.dart';
import 'package:hindi_course/widgets/drawer.dart';
import 'package:hindi_course/widgets/item_widget.dart';


class HomePage extends StatelessWidget {
  
  final int days =30;
  final String name = "Codepur";
   HomePage({super.key});
  final dummy_list = List.generate(15, (index) => CatalogModel.items[0]) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //builder renders items only on screen and some before and after it so when we scroll we don't feel they are being rendered after coming on screen
        child: ListView.builder(
          itemCount:dummy_list.length ,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummy_list[index]);
        },),
      ),
      drawer: MyDrawer(),
    );
  }
}
