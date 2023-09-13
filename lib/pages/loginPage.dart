import 'package:flutter/material.dart';
import 'package:hindi_course/utilities/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.asset("assets/images/undraw_two_factor_authentication_namy.png",
              fit:BoxFit.cover),
              SizedBox(height: 20,),
              Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16,horizontal:32),
                child: Column(
                  children: [
                    TextFormField(decoration: InputDecoration(hintText: "Enter Username",labelText: "Username"),),
                         SizedBox(height: 20,),
                
                TextFormField(obscureText: true,decoration: InputDecoration(hintText: "Enter password",labelText: "Password"),),
                SizedBox(height : 20),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(
                    context, MyRoutes.homeRoute);
                },
                 child: Text("Login"),
                 style: TextButton.styleFrom(),)
                  ],
                ),
              )
            ],),
        ),
      )
    );
  }
}