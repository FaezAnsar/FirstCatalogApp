import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hindi_course/models/cart.dart';
import 'package:hindi_course/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,title: Text("Cart",),),
      body: Column(children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CartList(),
        )),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CartTotal(),
        )

        

      ]),
    );
  }
}

class CartList extends StatelessWidget {
   CartList({super.key});

    
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[RemoveMutation]);
    if (_cart.items.isEmpty) {
      return Center(child: Text("Nothing to show",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
    } else {
      return ListView.builder(
      itemCount: _cart.items.length
      ,itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove_circle_outline,),
        onPressed:() { 
          RemoveMutation(_cart.items[index]??Item(id: 1, name: "faez", desc:"jioji" , price: 9000, color: "#1c1c1c", image: "https://lh3.googleusercontent.com/qRQPjHrhRVIs-xnfNSyiPXOH2vH97ylMacgbTKebqJtRfNH3LlYo8pN-5igsLDWUH62tGl5zNpTsl5xd8SprzGmXoCEmWFOi2-2cQVGS-r3PaRXHt62DmJHq-jrYX0UQvWZ9BA=s800-c")) ;
          ;
          }),
    
        title: Text("${_cart.items[index]?.name}"),

      ),);
    }
  }
}

class CartTotal extends StatelessWidget {

   
   CartTotal({super.key});
 
 
  @override
  Widget build(BuildContext context) {
     final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //didn't use vxwatch at start to prevent whole widget from being built as we just wanted to rebuild price
          VxBuilder(mutations: {RemoveMutation},
          builder:(context, _,__) =>Text("\$${_cart.totalPrice}",style: TextStyle(fontSize:25),))
            
          ,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buying not supported yet.")));
          }, child: Text("Buy"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).focusColor)))        ],
      ),
    );
  }
}