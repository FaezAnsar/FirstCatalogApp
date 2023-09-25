import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catalog.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item ;
  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      bottomNavigationBar: Container(
        
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          buttonMinWidth: 100,
          
          buttonPadding:EdgeInsets.all(18),
          alignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                          
                          
                          Text("\$${item.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 166, 25, 25),fontSize: 25,fontFamily: GoogleFonts.roboto().fontFamily),),
                          //wrapped with sized box to change butoon width height
                          SizedBox(width: 120,height: 50,

                            child: ElevatedButton(onPressed: (){}, child: Text("Add to Cart"),style: ButtonStyle(
                              shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(6),)
                              ,),
                              backgroundColor: MaterialStatePropertyAll(Theme.of(context).focusColor))))
                          ],
                          
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,),
              child: Hero(
                
                tag: Key(item.id.toString()),
                child: Image.network(item.image,height: 200,)
                
                ),
            ),
              
              Expanded(

                child: ClipPath(
                  
                  clipper: ConcaveShapeClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(color: Theme.of(context).cardColor,),
                    child: Padding(
                      padding: const EdgeInsets.only(top:70.0),
                      child: Column(children: [
                        
                        Text(item.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      Text(item.desc,style: TextStyle(fontStyle:FontStyle.normal,color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 20),
                       
            ),SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Wohl  sage schwankende euren der nach welt einer wird. Lauf jenem macht mögt lebens ich, aus sich herzen noch einer  den ach euch den, wenn das ach jenem freundschaft die noch und und, neu und es ergreift um bringt. Fühl bang sang der es lispelnd sich glück unbekannten.",style: TextStyle(color: Colors.grey),),
            )
                      ]),
                    ),
                    
                    
                              
                  ),
                ),
              ),

          ],
        )),
      
    );
  }
}

class ConcaveShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(0, size.height*.01); // Move upward
    path.quadraticBezierTo(
      size.width / 2, // Control point's x-coordinate (center of the container)
      size.height*.1, // Control point's y-coordinate (arch depth)
      size.width, // End point's x-coordinate (bottom-right corner)
      size.height * 0.01, // End point's y-coordinate (80% of the container's height)
    );
    path.lineTo(size.width, size.height); // Finish the path
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}