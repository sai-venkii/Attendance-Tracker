import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  final String email;
  const StudentPage(
      {
        super.key,
        required String email
      });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Student Page"),
      ),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              /*Check attendence-Student
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
                    "Check Attendence",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ) ,
                onPressed:(){

                },

              ),
            ),*/
            const SizedBox(
                height: 40
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.lightBlue[100],
              ),
              child:ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.cyan),
                ),
                child:const Center(
                  child:Text(
                    "Scan QR",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ) ,
                onPressed:(){

                },

              ),
            ),


            ],

        ),
      );

  }
}
