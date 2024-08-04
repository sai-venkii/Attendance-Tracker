// ignore_for_file: prefer_const_constructors

import 'package:attendence/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPageLayout extends StatefulWidget{
  final String path;
  final String role;
  final double h;
  final double w;
  const LoginPageLayout({
    super.key,
    required this.path,
    required this.role,
    required this.h,
    required this.w
  });

  @override
  State<LoginPageLayout> createState() => _LoginPageLayoutState();
}

class _LoginPageLayoutState extends State<LoginPageLayout> {
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  FocusNode usernameField=FocusNode();
  FocusNode passwordField=FocusNode();
  bool isVisible=false;
  @override
  Widget build (BuildContext context){
    return Scaffold(
        backgroundColor : Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: <Widget>[
                  profile(widget.path),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.role} Login",
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
                                  focusNode: usernameField,
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  onSubmitted: (value)=>{
                                    FocusScope.of(context).requestFocus(passwordField)
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.grey
                                      )
                                    )
                                ),
                                child: TextField(
                                  focusNode: passwordField,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              // Center(
                              //     child :Text(
                              //       "Forgot password?",
                              //       style:TextStyle(
                              //           color:Color.fromRGBO(196, 135, 198, 1)
                              //       ),
                              //     )
                              // ),

                              Container(
                                height: 50,
                                margin: EdgeInsets.all(60),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlue[100],
                                  border: Border.all(
                                    color: Colors.blueAccent
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 20,
                                    )
                                  ]
                                ),
                                child:ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.cyan),
                                  ),
                                  child:Center(
                                    child:Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ) ,
                                  onPressed:() async{
                                    await AuthService().signIn(
                                        email: _usernameController.text.trim(),
                                        password: _passwordController.text.trim(),
                                        isStudent: (widget.role == "Student"? true : false),
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
              ),
          ),
        )
        );
      }
}
Widget profile(String path){
  return SizedBox(
    height:300,
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

