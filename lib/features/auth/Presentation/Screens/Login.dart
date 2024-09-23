import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Onboarding/Presentaion/widgets/CustomeButtonAuth.dart';
import '../../Data/RepoImp/AuthRepoImp/AuthRepoImp.dart';
import '../Widgets/CustomeTextFormField.dart';
import '../Widgets/CustomeTextFormFieldPass.dart';
import 'Signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  AuthRepoImp authrepoimp=AuthRepoImp();
  GlobalKey<FormState> authloginkey=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: authloginkey,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff001334),
          child: ListView(children: [
            //text
            SizedBox(height: 30,),
            Center(child: Text("Login",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),)),
            Center(child: Text("Welcome Back ..!",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),)),SizedBox(height: 130,),

            //form
            Text("Email",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
            CustomeTextFormField(controller: email,),SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
            CustomeTextFormFieldPass(controller: password,),
           //forget password
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));},
                child:Text("Forget Your Password ?",style: TextStyle(color:Color(0xff014BB4),fontSize:12),),),
            ),
            //button
            CustomeButtonAuth(ontap: (){
              authloginkey.currentState!.validate();
              authrepoimp.Login(email.text.trim(), password.text.trim(), context);
            },textcolor:Colors.white,baclground: Color(0xff014BB4),text: "Login",left: 20,right: 20,top: 10,bottom: 10,),

            //don't have account
             TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(),));},
                child:Text("Don't Have An Account ?",style: TextStyle(color:Color(0xff014BB4),fontSize:12),),),
          ],),
        ),
      ),
    );
  }
}
