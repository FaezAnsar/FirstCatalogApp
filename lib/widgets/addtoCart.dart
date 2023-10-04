import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hindi_course/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class AddtoCart extends StatelessWidget {
  final Item item;
   AddtoCart({required this.item});


  @override
  Widget build(BuildContext context) {

   VxState.watch(context,on:[AddMutation,RemoveMutation]);//rebuilds widget when mutation takes place,
   
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool pressed = _cart.items.contains(item);
    return ElevatedButton(onPressed: () {
     
    
      //will only change value first time thus we can't add item which is already added
      if (!pressed){
       AddMutation(item);//mutation taken place
      
    } },
    
    child: (pressed)?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus),

    style: ButtonStyle(
      shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2),)),
      backgroundColor: MaterialStatePropertyAll(Theme.of(context).focusColor)));
  }
}