import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hindi_course/models/cart.dart';

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

  final cartobj = CartModel();

  @override
  Widget build(BuildContext context) {
    if (cartobj.items.isEmpty) {
      return Center(child: Text("Nothing to show",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
    } else {
      return ListView.builder(
      itemCount: cartobj.items.length
      ,itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove_circle_outline,),
        onPressed:() { 
          cartobj.remove(cartobj.items[index]) ;
          ;
          }),
    
        title: Text("${cartobj.items[index]?.name}"),

      ),);
    }
  }
}

class CartTotal extends StatelessWidget {

   
   CartTotal({super.key});
 
 
  @override
  Widget build(BuildContext context) {
    final  cartobj = CartModel();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$${cartobj.totalPrice}",style: TextStyle(fontSize:25),),
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buying not supported yet.")));
          }, child: Text("Buy"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).focusColor)))        ],
      ),
    );
  }
}