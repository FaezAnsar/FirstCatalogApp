import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5
      ,itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: Icon(Icons.remove_circle_outline),
        title: Text("item1"),

      ),);
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$999",style: TextStyle(fontSize:25),),
          ElevatedButton(onPressed: (){}, child: Text("Buy"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).focusColor)))        ],
      ),
    );
  }
}