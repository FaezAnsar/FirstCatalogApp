import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hindi_course/models/catalog.dart';
import 'package:hindi_course/pages/item_detail_page.dart';
import 'package:hindi_course/utilities/routes.dart';


import 'package:hindi_course/widgets/item_widget.dart';
import 'package:hindi_course/widgets/themes.dart';

import 'catalogHeader.dart';


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
   // await Future.delayed(Duration(seconds: 2));
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
       return InkWell(
      
        //didn't use Navigator.pushNamed as we want to pass item to the page but it takes route only,while in .push we can pass object
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>ItemDetailPage(item: item,)) ),
        child: ItemWidget(item: item));
         
  } );
  } else {
    return null; 
  }
}


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      //works fine as bg is set to canvas color
      //backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(onPressed:()=>Navigator.pushNamed(context,MyRoutes.cartRoute),
      
      backgroundColor: MyTheme.darkBluishColor,
      child: Icon(CupertinoIcons.cart,color: Colors.white,),),
     body: SafeArea(

      child: Container(
        padding:EdgeInsets.all(20),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            Expanded(child: Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: getItemWidget()
              ??Center(child: CircularProgressIndicator(),),
            )),
            
          ],
        ),
      )),
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