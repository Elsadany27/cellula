import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/core/utilities/constants.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

import '../../../Onboarding/Presentaion/widgets/CustomeButtonAuth.dart';
import '../../Data/RepoImp/AuthRepoImp/AuthRepoImp.dart';
import '../Widgets/CustomeTextFormField.dart';
import '../Widgets/CustomeTextFormFieldPass.dart';
import 'Signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the ScreenUtil package

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  AuthRepoImp authrepoimp = AuthRepoImp();
  Appconstants constantss = Appconstants();
  GlobalKey<FormState> authloginkey = GlobalKey();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authloginkey,
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
                  "Login",
                  style: TextStyle(
                    fontSize: 40.sp, // Responsive font size
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Welcome Back ..!",
                  style: TextStyle(
                    fontSize: 15.sp, // Responsive font size
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 130.h),

              // Form fields
              Text(
                "Full Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h), // Added responsive spacing
              CustomeTextFormField(controller: fullname),
              SizedBox(height: 20.h),
              Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
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

              // Forget password link
              Container(
                margin: EdgeInsets.only(bottom: 20.h), // Responsive margin
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    // Assuming you wish to navigate to a password recovery screen
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(), // This should be your recovery page
                      ),
                    );
                  },
                  child: Text(
                    "Forget Your Password?",
                    style: TextStyle(color: Color(0xff014BB4), fontSize: 12.sp), // Responsive font size
                  ),
                ),
              ),

              // Login button
              Consumer<AuthController>(
                builder: (context, provider, child) {
                  return CustomeButtonAuth(
                    ontap: () {
                      authloginkey.currentState!.validate();
                      authrepoimp.Login(email.text.trim(), password.text.trim(), context);
                      provider.username = fullname.text.trim();
                      provider.email = email.text.trim();
                    },
                    textcolor: Colors.white,
                    baclground: Appconstants.color,
                    text: "Login",
                    left: 20.w,
                    right: 20.w,
                    top: 10.h,
                    bottom: 10.h,
                  );
                },
              ),

              // Link to signup page
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  "Don't Have An Account?",
                  style: TextStyle(color: Color(0xff014BB4), fontSize: 12.sp), // Responsive font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}