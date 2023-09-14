import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hindi_course/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   
   

   //formstate is used to validate
   //we associate this key with the form key
   final _formKey =GlobalKey<FormState>();

  String name = "";
  bool click = false;
  bool back = false;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  

  moveToHome (BuildContext context) async{
    //vallidate() Validates every [FormField] that is a descendant of this [Form], and returns true if there are no errors.
//The form will rebuild to report the results.
    if (_formKey.currentState!.validate()){
      setState(() {
          click = true;
          
      });
      await Future.delayed(Duration(seconds: 1),);
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      //sets state to false immediately after new screen is pushed sp when we return back to login screen the widgets are refreshed due to set state thus we seee changes then
      setState(() {
        click = false;
        _controller.text="";//empties username
        _controller2.text= "";// empties password

      });
    
   }}
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                      "assets/images/undraw_two_factor_authentication_namy.png",
                      fit: BoxFit.cover),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Welcome $name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controller, //to control text 
                          
                          
                          
                          
                          decoration: InputDecoration(
                              hintText: "Enter Username", labelText: "Username"),
                              validator: (value) {
                            if ( value!.isEmpty){
                              return "Username can't be empty";
                            }
                              else
                              {return null;}
            
                            
                          },
                              onChanged: (value){
                                name = value;
                                
                                
                                setState(() {
                                  
                                });

                              },
                              

                            

                              
                              
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _controller2, //to control text 
                            
            
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter password", labelText: "Password"),
                              validator: (value) {
                            if ( value!.isEmpty){
                              return "Password can't be empty";
                            }
                              else if(value.length<6)
                              {return "Enter at least 6 characters";}
            
                              else
                              {return null;}
                            },
                        ),
                        SizedBox(height: 20),
                        Material(
                          color: Colors.green,
                          borderRadius:BorderRadius.circular(click?50:8),
                          child: InkWell(
                            //onTap sets state and waits 1sec after tapping this allows us to see the button being animated ,then it changes to next slide
                            onTap: ()  =>moveToHome(context),
                              
                             
                            child: AnimatedContainer( //if we use ink instead of container we will get ripple effect
                              //color: Colors.green, defined in decoration
                              duration: Duration(seconds: 1),
                              width: click?50:140,
                              height: 50,
                              alignment: Alignment.center,
                              child: click?Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(fontSize: 20 )),
                              
                            ),
                          ),
                        )
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                        //   },
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
