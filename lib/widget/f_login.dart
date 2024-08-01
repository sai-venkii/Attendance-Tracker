import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class_details.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({super.key});

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Faculty Page"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          /*Facuty-Checks for student's attendence
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
                  "Check Student's Attendence",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ) ,
              onPressed:(){

              },

            ),
          ),
          */
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
                  "Generate QR",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ) ,
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassDetails()));
              },

            ),
          ),


        ],

      ),
    );

  }
}
