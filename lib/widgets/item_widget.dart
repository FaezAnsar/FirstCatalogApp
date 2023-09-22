
import 'package:flutter/material.dart';
import 'package:hindi_course/widgets/themes.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key ,required this.item});

  @override
  Widget build(BuildContext context) {
     
     //style 1
     //return 
     // Card(
    //   child: ListTile(
    //     leading: Image.network(item.image),
    //     title: Text(item.name),
    //     subtitle: Text(item.desc),
    //     trailing: Text("\$${item.price}",
    //     style:TextStyle(color: Colors.green,
    //     fontWeight: FontWeight.bold) ,
    //     textScaleFactor:1.5 ,),
        
    //   ),
    // ) ;

    //style 2
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
       
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        ),
        
       // color: Colors.green,
      
       //width: 400,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [

             Container(
              
              width: 130,
              
              decoration: BoxDecoration(color: MyTheme.creamColor,borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.network(item.image),
              )),
              SizedBox(width: 7,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.name,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(item.desc,style: TextStyle(fontStyle:FontStyle.normal,color: Colors.grey,fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.width * 0.028,overflow: TextOverflow.ellipsis, // Truncate with ellipsis when text overflows
   ), // Limit to a single line),
    maxLines: 1,
                    ),
                    SizedBox(height: 7,),
                    Expanded(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                        Text("\$${item.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
                        ElevatedButton(onPressed: (){}, child: Text("Buy"),style: ButtonStyle(shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(6),))))
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}