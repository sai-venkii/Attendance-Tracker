// ignore_for_file: prefer_const_constructors

import 'package:attendence/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPageLayout extends StatelessWidget{
  final String path;
  final String role;
  final double h;
  final double w;
  LoginPageLayout({
    super.key,
    required this.path,
    required this.role,
    required this.h,
    required this.w
  });
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final CollectionReference sample=FirebaseFirestore.instance.collection("Sample");
  Future<void> login() async{
    sample.add(
      {
        'email': _usernameController.text,
        'password': _passwordController.text
      }
    );
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
        backgroundColor : Colors.white,
        body: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: <Widget>[
              profile(path),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$role Login",
                      style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontWeight:FontWeight.bold,
                          fontSize:30
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .01),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey
                                  )
                                )
                            ),
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                    color: Colors.grey
                                ))
                            ),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Center(
                          //     child :Text(
                          //       "Forgot password?",
                          //       style:TextStyle(
                          //           color:Color.fromRGBO(196, 135, 198, 1)
                          //       ),
                          //     )
                          // ),
                          SizedBox(
                            height: 40
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.lightBlue[100],
                            ),
                            child:ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Colors.cyan),
                              ),
                              child:Center(
                                child:Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ) ,
                              onPressed:() async{
                                await AuthService().signIn(
                                    email: _usernameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    isStudent: (role == "Student"? true : false),
                                    context: context
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]
          )
        );
      }
      /*
  void navigateToFLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentPage()));
  }
  void navigateToSLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FacultyPage()));
*/
}
Widget profile(String path){
  return SizedBox(
    height:400,
    child: Stack(
      children:<Widget>[
        Positioned(
          child: Container(
            decoration:BoxDecoration(
                image:DecorationImage(
                  image:AssetImage(path),
                )
            ),
          ),
        )
      ],
    ),
  );
}

