import 'package:flutter/material.dart';

import 'class_details.dart';

class FacultyPage extends StatefulWidget {
  final String email;
  const FacultyPage({
    super.key,
    required this.email
  });

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Faculty Page"),
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
                  "Generate QR",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ) ,
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ClassDetails(email: widget.email,)));
              },

            ),
          ),


        ],

      ),
    );

  }
}
