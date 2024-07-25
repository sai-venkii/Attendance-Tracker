// ignore_for_file: prefer_const_constructors

import 'package:attendence/pages/student_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentLogin()));
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
                                      image: AssetImage('assets/images/student_logo.jpg'),
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
                Card(
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
                                    image: AssetImage('assets/images/teacher_icon.png'),
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
            ]
            ),
          ),
        ),
      );
  }
}