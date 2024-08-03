import 'package:attendence/pages/faculty_home.dart';
import 'package:attendence/pages/student_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthService{
  Future<void> signIn(
      {
        required String email,
        required String password,
        required bool isStudent,
        required BuildContext context
      }
      ) async{
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => isStudent ? StudentPage(email: email) : FacultyPage(email: email)
          )
        );
      }on FirebaseAuthException catch(e){
        if (kDebugMode) {
          print(e.code);
        }
      }
  }
}