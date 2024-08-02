// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

import 'pages/login_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyCiantarowO3bMNLFoMEbZzCh1Jx932efk',
        appId: '1:900714223972:android:f183af47dd6f4a18ad0271',
        messagingSenderId: '900714223972',
        projectId: 'attendance-36b4d'
    )
  ):await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//getting the size property
//getting the orientation

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Text(
                  "Choose your role",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                GestureDetector(
                  onTap: (){
           
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>LoginPageLayout(
                                path: 'assets/images/student_login.png',
                                role: 'Student',
                                h:350,
                                w:480,
                            )
                        )
                    );
                  },
                  child: Card(
                      child: Stack(
                        children: [
                          Container(
                            width: 225,
                            height: 225,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 0.3,
                                      blurRadius: 20
                                  )
                                ]
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: AssetImage('assets/images/student_login.png'),
                                      width: 125,
                                      height: 125,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Student",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>LoginPageLayout(
                                path: 'assets/images/faculty_login.png',
                                role: 'Faculty',
                                h:300,
                                w: 400,

                            )
                        )
                    );
                  },
                  child:Card(
                      child: Stack(
                        children: [
                          Container(
                            width: 225,
                            height: 225,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 0.3,
                                      blurRadius: 20
                                  )
                                ]
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: AssetImage('assets/images/faculty_login.png'),
                                      width: 125,
                                      height: 125,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Teacher",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
