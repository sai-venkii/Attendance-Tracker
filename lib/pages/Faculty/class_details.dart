import 'dart:ui';

import 'package:attendence/pages/Faculty/QR_display.dart';
import 'package:attendence/print.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClassDetails extends StatefulWidget {
  final String email;
  ClassDetails({
    super.key,
    required this.email
  });
  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  late String email;
  String? selected_course="";
  List<String> courses = [];
  String hour = "1";

  @override
  void initState() {
    super.initState();
    email = widget.email;
    _getCoursesHandling();
  }

  Future<void> _getCoursesHandling() async {
    try {
      DocumentSnapshot<
          Map<String, dynamic>> documentSnapshot = await FirebaseFirestore
          .instance
          .collection('Lecturer')
          .doc(widget.email)
          .get();
      if (documentSnapshot.exists) {
        myDebugPrint('doc exists');
        var data = documentSnapshot.data();
        if (data != null && data.containsKey('Courses')) {
          myDebugPrint('data yes');
          setState(() {
            courses = List<String>.from(data['Courses']);
            if (courses.isNotEmpty) {
              selected_course = courses[0];
            }
          });
        }
      }
    } catch (e) {
      myDebugPrint(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Details"),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            const Text(
              "Select Course",
              style: TextStyle(
                fontSize: 20
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: DropdownButton<String>(
              hint: const Text('Select Course'),
              value: selected_course,
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 50,
              ),
              isExpanded: true,
              items: courses.map((String ele){
                return DropdownMenuItem<String>(
                  value: ele,
                  child: Text(
                    ele,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              }
              ).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selected_course = newValue!;
                }
                );
              }
          )
      ),
            const Text(
              "Select Hour",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
        Padding(
            padding: const EdgeInsets.all(40),
            child: DropdownButton<String>(
                hint: const Text('Select Course'),
                value: hour,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 50,
                ),
                isExpanded: true,
                items: <String> [
                  "1","2","3","4","5","6","7","8"
                ].map((String ele){
                  return DropdownMenuItem<String>(
                    value: ele,
                    child: Text(
                      ele,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    hour = newValue!;
                  }
                  );
                }
            )
        ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>QrDisplay(
                          email: email,
                          courseId: selected_course ?? 'Invalid',
                          hour: hour,
                        )
                      )
                    );
                  },
                  child: const Text("Generate")
              ),
            )
          ]
        ),
      ),
    );
  }
}
