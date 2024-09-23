import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stylish/features/Home/Presentation/Screens/HomePage.dart';
import '../../../Domain/Repo/AuthRepo/AuthRepo.dart';
import '../../../Presentation/Screens/Login.dart';

class AuthRepoImp extends AuthRepo{
  //sign up
  @override
   Signup(String email, String password,context)async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account has been created")));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The password provided is too weak.",style: TextStyle(color: Colors.black),),
          elevation: 20,
          backgroundColor: Colors.white,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The account already exists for that email.",style: TextStyle(color: Colors.black),),
          elevation: 20,
          backgroundColor: Colors.white,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e",style: TextStyle(color: Colors.black),),
        elevation: 20,
        backgroundColor: Colors.white,
      ));
    }
  }
  //login
@override
  Login(String email, String password, context)async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("user-not-found",style: TextStyle(color: Colors.black),),
      elevation: 20,
      backgroundColor: Colors.white,
    ));
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No user found for that email.",style: TextStyle(color: Colors.black),),
        elevation: 20,
        backgroundColor: Colors.white,
      ));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong password provided for that user.",style: TextStyle(color: Colors.black),),
        elevation: 20,
        backgroundColor: Colors.white,
      ));
    }
  }
  }
}
