import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hindi_course/models/catalog.dart';
import 'package:hindi_course/widgets/drawer.dart';
import 'package:hindi_course/widgets/item_widget.dart';
import 'package:hindi_course/widgets/themes.dart';


class HomePage extends StatefulWidget {
  

   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days =30;

  final String name = "Codepur";

  

//called when object is first inserted into tree
//i.e before build method is called
  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{

    //since we are getting data locally it is very fast ,so we give delay to simulate real life in which data takes time to come thus catalog.items will be null for that time
    await Future.delayed(Duration(seconds: 2));
    //(root bundle contains resources packaged with this app),it finds the file and  loads it as string
    var jsonString = await rootBundle.loadString("assets/files/catalog.json");
    //converts string to Json obj i.e map in this case
    //basically jsonDecode just removes the inverted commas/string apostrophe
    var jsonObject = jsonDecode(jsonString);
    var productsList = jsonObject["products"];
    //creating list of items
    //since map returns iterable we convert it to a list
    CatalogModel.items = productsList.map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
      
    });
  }
Widget? getItemWidget() {
  var shadow = CatalogModel.items;
  //isnotEmpty is only checked after shadow!=null gives true thus we can't swap both conditions as isnptempty cant be called on null
  if (shadow!= null && shadow.isNotEmpty) {
  
 return  ListView.builder(
   shrinkWrap: true,
   
   //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16),
   
       itemCount:shadow.length ,
     itemBuilder: (context, index) {
       var item = shadow[index];
       return ItemWidget(item: item);
         
  } );
  } else {
    return null; 
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
     body: SafeArea(
      child: Container(
        padding:EdgeInsets.all(20),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            Expanded(child: getItemWidget()??Center(child: CircularProgressIndicator(),)),
            
          ],
        ),
      )),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[Text("Catalog App",style: TextStyle(color: Colors.deepPurple,fontSize: 40,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text("Trending Products",style: TextStyle(color: Colors.black87,fontSize: 20),)
      ],
    );
  }
}
 // appBar: AppBar(
      //   title: Text("Catalog App "),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   //if 
      //   child:getItemWidget()??Center(child: CircularProgressIndicator(),)
      // ),
      // drawer: MyDrawer(),