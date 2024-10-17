import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/features/Onboarding/Presentaion/Screens/secoundscreen.dart';

import '../widgets/CustomeButtonAuth.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/j-schiemann-Z4Sxy1_3wdY-unsplash.png"),
            fit: BoxFit.cover, // Change from fill to cover for better responsiveness
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use a flexible spacer to adjust with screen size
            SizedBox(height: 400.h), // Adjusted this value for better spacing on smaller screens
            Text(
              "Meet your Court Partner!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h), // Reduced size for better spacing
            Text(
              "The perfect opportunity to meet \npeople and find your perfect \ntennis partner.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            // Spacer to push the button down
            Spacer(), // This allows for dynamic spacing and pushes the button to the bottom
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.r), // Use symmetric horizontal padding
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: 30.h), // Add bottom margin for better spacing
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecoundScreen(),
                    ),
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff192B59),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.r,
                    vertical: 10.r,
                  ), // Use symmetric padding for better responsiveness
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}