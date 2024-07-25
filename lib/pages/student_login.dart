import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class StudentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      body: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
//
//
// SafeArea(
// child: Scaffold(
// backgroundColor: Colors.grey[200],
// body: const Center(
// child: Padding(
// padding: EdgeInsets.only(top: 80),
// child: Column(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(100)),
// child: Image(
// image: AssetImage('assets/images/student_logo.jpg'),
// height: 200,
// width: 200,
// fit: BoxFit.cover
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top:60),
// child: Text(
// 'Sign in as Student',
// style: TextStyle(
// fontSize: 30,
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 50),
// child: SizedBox(
// width: 300,
// child: TextField(
// decoration: InputDecoration(
// labelText: 'Username',
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.grey,
// width: 2
// ),
// ),
// ),
// ),
// ),
// ),
// Padding(
// padding: EdgeInsets.only(top: 30),
// child: SizedBox(
// width: 300,
// child: TextField(
// decoration: InputDecoration(
// labelText: 'Password',
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.grey,
// width: 2
// ),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );

