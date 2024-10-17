import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../auth/Presentation/Widgets/CustomeTextFormField.dart';
import '../widgets/custome_buttin.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/Image (1).png"),fit: BoxFit.fill)
          ),
          child: Column(children: [
            SizedBox(height: 30,),
            //appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                Text("Change Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                Container()
              ],),SizedBox(height: 30,),

            //textformfield
            CustomeTextFormField(text:"Email",controller: email,),
            //button
            SizedBox(height: 10,),
            CustomeButtonn(ontap: ()async{
              await FirebaseAuth.instance
                  .sendPasswordResetEmail(email: "${email.text}");
            },name_button: "Send Code",color: Colors.black,)
          ],),
        ),
      );
  }
}
