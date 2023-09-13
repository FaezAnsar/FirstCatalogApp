import 'package:flutter/material.dart';
import 'package:hindi_course/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
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
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
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
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter password", labelText: "Password"),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        //onTap sets state and waits 1sec after tapping this allows us to see the button being animated ,then it changes to next slide
                        onTap: () async {
                          setState(() {
                            click = true;
                        });
                        await Future.delayed(Duration(seconds: 1),);
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        } ,
                        child: AnimatedContainer(
                          //color: Colors.green, defined in decoration
                          duration: Duration(seconds: 1),
                          width: click?50:140,
                          height: 50,
                          alignment: Alignment.center,
                          child: click?Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(fontSize: 20 )),
                          decoration: BoxDecoration(
                            color:Colors.green,
                            borderRadius:BorderRadius.circular(click?50:8)
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
        ));
  }
}
