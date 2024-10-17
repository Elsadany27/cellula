import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';
import 'package:stylish/features/auth/Presentation/Screens/Login.dart';
import 'package:stylish/features/profile/Data/Repoimp/ProfileRepoImpl.dart';
import 'package:stylish/features/profile/Presentation/provider/ProfileController.dart';

import 'Changepassword.dart';
import 'HelpCenter.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});
  // ProfileRepoImpl profilerepoimpl=ProfileRepoImpl();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
  builder: (context, provider, child) {
  return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/Image (1).png"),fit: BoxFit.fill)),
        child: Column(children: [
          SizedBox(height: 120,),
          //image
          provider.urlimage==null?CircleAvatar(backgroundImage: AssetImage("images/7229a2262762.5ec41fb7d6398-removebg-preview-removebg-preview.png"),radius: 35,):
              CircleAvatar(backgroundImage: NetworkImage("${provider.urlimage}"),radius: 35,),SizedBox(height: 15,),
          //text username
          Text("${Provider.of<AuthController>(context).username}",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
          Text("${Provider.of<AuthController>(context).email}",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w100),),SizedBox(height: 15,),
          //settings
          Container(
            margin: EdgeInsets.only(top: 80),
            padding: EdgeInsets.only(top: 20),
            height: 320,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black,width: 1)
            ),
            child: Column(children: [
              ListTile(leading: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.camera,color: Colors.white,),radius: 20,),title: Text("Edit Picture",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Colors.white),),trailing: IconButton(onPressed: (){
                provider.gettimage();
              },icon: Icon(Icons.arrow_forward_ios_outlined),color: Colors.white,),),SizedBox(height: 10,),
              ListTile(leading: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.lock,color: Colors.white,),radius: 20,),title: Text("Change Password",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Colors.white),),trailing: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangePassword(),));
              },icon: Icon(Icons.arrow_forward_ios_outlined),color: Colors.white,),),SizedBox(height: 10,),
              ListTile(leading: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.help_outline,color: Colors.white,),radius: 20,),title: Text("Help Center",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Colors.white),),trailing: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpCenter(),));
              },icon: Icon(Icons.arrow_forward_ios_outlined),color: Colors.white,),),SizedBox(height: 10,),
              ListTile(leading: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.logout,color: Colors.white,),radius: 20,),title: Text("Log out",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Colors.white),),trailing: IconButton(onPressed: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(),),(route) => false,);
              },icon: Icon(Icons.arrow_forward_ios_outlined),color: Colors.white,),),SizedBox(height: 10,),
            ],),
          )
        ],),
      ),
    );
  },
);
  }
}
