import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/Presentation/Screens/Login.dart';
import '../../../auth/Presentation/Screens/Signup.dart';
import '../widgets/CustomeButtonAuth.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Utilize the entire screen height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/secoundon.jpg"),
            fit: BoxFit.cover, // Changed to cover for better responsiveness
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using SizedBox with dynamic height
            SizedBox(height: 100.h), // Reduced the height for better responsiveness
            // Buttons
            CustomeButtonAuth(
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              text: "Login",
              baclground: Colors.white38,
              textcolor: Colors.black,
              left: 80.w, // Adjusted the left and right paddings for responsiveness
              right: 80.w,
              top: 15.h, // Slightly increased height for better touch size
              bottom: 15.h,
            ),
            SizedBox(height: 15.h),
            CustomeButtonAuth(
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              text: "Sign up",
              baclground: Color(0xff192B59),
              textcolor: Colors.white,
              left: 80.w,
              right: 80.w,
              top: 15.h,
              bottom: 15.h,
            ),
            SizedBox(height: 20.h), // Add additional space below buttons for better visuals
          ],
        ),
      ),
    );
  }
}