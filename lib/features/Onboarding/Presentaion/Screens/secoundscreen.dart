import 'package:flutter/material.dart';
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
        height: 900,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/secoundon.jpg"),fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 450,),
            //buttons
            CustomeButtonAuth(ontap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));},text: "Login",baclground: Colors.white38,textcolor: Colors.black,left: 110,right: 110,top: 10,bottom: 10,),SizedBox(height: 15,),
            CustomeButtonAuth(ontap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(),));},text: "Sign up",baclground: Color(0xff192B59),textcolor: Colors.white,left: 110,right: 110,top: 10,bottom: 10,),
          ],),
      ),
    );
  }
}
