import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class AddtoCart extends StatelessWidget {
  final Item item;
   AddtoCart({required this.item});

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
   
    bool pressed = _cart.items.contains(item);
    return ElevatedButton(onPressed: () async{
     
      //will only change value first time thus we can't add item which is already added
      if (!pressed){
        pressed = true;
      final _catalog = CatalogModel();
      
      _cart.catalog = _catalog;//using setter of cart model to assign catalog
     _cart.add(item);}//adding the item we got from constructor initialization
      
      
    }, 
    
    child: (pressed)?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus),

    style: ButtonStyle(
      shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2),)),
      backgroundColor: MaterialStatePropertyAll(Theme.of(context).focusColor)));
  }
}