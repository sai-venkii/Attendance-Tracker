import 'package:attendence/pages/Faculty/faculty_home.dart';
import 'package:attendence/pages/student/student_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendence/print.dart';
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
        ScaffoldMessenger.of(context).showSnackBar(
            snackBarCustom("Login Success", Colors.green)
        );
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => isStudent ? StudentPage(email: email) : FacultyPage(email: email)
          )
        );
      }on FirebaseAuthException catch(e){
        String? code=e.code;
        String? message;
        if(code=='invalid-email' || code=='invalid-credential'){
          message="Invalid Credentials";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarCustom(message, Colors.red)
        );
        myDebugPrint(e.message);
      }catch(e){
        myDebugPrint(e);
        ScaffoldMessenger.of(context).showSnackBar(
            snackBarCustom("Error logging In", Colors.red)
        );
      }
  }
}
SnackBar snackBarCustom(String? message, Color color){
  return SnackBar(
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    content: Text(message ?? 'Failed To Login'),
    backgroundColor: color,
  );
}