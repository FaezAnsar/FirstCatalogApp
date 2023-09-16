import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
 
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final url ='https://media.licdn.com/dms/image/D4D35AQGS0ZoB4cGSDQ/profile-framedphoto-shrink_100_100/0/1677648969740?e=1695448800&v=beta&t=nzn6uCjv7S6FkIYRWRxY6i7nKckwJp7Ga5gP5Pwrwq0';
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          
          children: [
            
          DrawerHeader(
            padding:EdgeInsets.zero,
            child: UserAccountsDrawerHeader(accountName:Text("Faez Ansar"), 
            accountEmail: Text("Faez@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),),
            
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,color: Colors.white,),
              title: Text("Home",
              textScaleFactor: 1.2,
              style:TextStyle(color: Colors.white) ,)
              
          ),
           ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text("Profile",
              textScaleFactor: 1.2,
              style:TextStyle(color: Colors.white) ,)
              
          ),
           ListTile(
            leading: Icon(
              CupertinoIcons.mail,color: Colors.white,),
              title: Text("Email Me",
              textScaleFactor: 1.2,
              style:TextStyle(color: Colors.white) ,)
              
          ),
          ],
        ),
      ),
    );
  }
}