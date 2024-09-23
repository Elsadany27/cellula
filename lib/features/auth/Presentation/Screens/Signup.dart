import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

import '../../../Onboarding/Presentaion/widgets/CustomeButtonAuth.dart';
import '../../Data/RepoImp/AuthRepoImp/AuthRepoImp.dart';
import '../Widgets/CustomeTextFormField.dart';
import '../Widgets/CustomeTextFormFieldPass.dart';
import 'Login.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
   AuthRepoImp authrepoimp=AuthRepoImp();
   GlobalKey<FormState> authkey=GlobalKey();
   TextEditingController fullname=TextEditingController();
   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: authkey,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff001334),
          child: ListView(children: [
              //text
            SizedBox(height: 30,),
            Center(child: Text("Sign Up",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),)),
            Center(child: Text("Create An Account To Make SDFSDF",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400),)),SizedBox(height: 50,),

            //form
            Text("Full Name",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
            CustomeTextFormField(controller: fullname,),SizedBox(height: 20,),
            Text("Email",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
            CustomeTextFormField(controller: email,),SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
            CustomeTextFormFieldPass(controller: password,),SizedBox(height: 50,),
            CustomeButtonAuth(ontap: (){
              authkey.currentState!.validate();
              authrepoimp.Signup(email.text.trim(), password.text.trim(),context);
              Provider.of<AuthController>(context).username=fullname.text;
            },textcolor:Colors.white,baclground: Color(0xff014BB4),text: "Sign up",left: 20,right: 20,top: 10,bottom: 10,),

            //login
            TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));},
              child:Text("Have an Account ?",style: TextStyle(color:Color(0xff014BB4),fontSize:15),),)
          ],),
        ),
      ),
    );
  }
}
