



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[Text("Catalog App",style: TextStyle(color:Theme.of(context).highlightColor,fontSize: 40,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text("Trending Products",style: TextStyle(color: Theme.of(context).highlightColor,fontSize: 20),)
      ],
    );
  }
}
 