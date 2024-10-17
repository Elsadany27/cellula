import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the ScreenUtil package
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

import '../../../Onboarding/Presentaion/widgets/CustomeButtonAuth.dart';
import '../../Data/RepoImp/AuthRepoImp/AuthRepoImp.dart';
import '../Widgets/CustomeTextFormField.dart';
import '../Widgets/CustomeTextFormFieldPass.dart';
import 'Login.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  AuthRepoImp authrepoimp = AuthRepoImp();
  GlobalKey<FormState> authkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authkey,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.w), // Changed to responsive padding
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff001334),
          child: ListView(
            children: [
              // Title text
              SizedBox(height: 30.h),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40.sp, // Responsive font size
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Create An Account To Make SDFSDF", // You can replace with a meaningful text
                  style: TextStyle(
                    fontSize: 15.sp, // Responsive font size
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 50.h),

              // Form fields
              Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h), // Added responsive spacing
              CustomeTextFormField(controller: email),
              SizedBox(height: 20.h),

              Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              CustomeTextFormFieldPass(controller: password),
              SizedBox(height: 50.h),

              // Sign up button
              CustomeButtonAuth(
                ontap: () {
                  if (authkey.currentState!.validate()) {
                    authrepoimp.Signup(email.text.trim(), password.text.trim(), context);
                  }
                },
                textcolor: Colors.white,
                baclground: Color(0xff014BB4),
                text: "Sign up",
                left: 20.w,
                right: 20.w,
                top: 10.h,
                bottom: 10.h,
              ),

              // Login link
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Have an Account?",
                  style: TextStyle(color: Color(0xff014BB4), fontSize: 15.sp), // Responsive font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}