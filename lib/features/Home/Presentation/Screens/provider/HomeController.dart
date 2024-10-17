import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Onboarding/Presentaion/widgets/CustomeButtonAuth.dart';
import '../../../../auth/Presentation/Provider/AuthController.dart';

class HomeController extends ChangeNotifier{
  String? city;
  List? data=[];

  predictResult(context)async{
    if(data!.first==1){
      showDialog(context: context, builder: (context) => AlertDialog(
        elevation: 20,
        shadowColor: Colors.black,
        title: Text("Hi ${Provider.of<AuthController>(context,listen: false).username}"),
        content: Text("The weather of this day is better for playing"),
        actions: [
          CustomeButtonAuth(ontap: (){Navigator.of(context).pop();},text: "ok",baclground: Colors.black,textcolor: Colors.white,right: 10,left: 10,top: 10,bottom: 10,)
        ],
      ),);
    }else{
      showDialog(context: context, builder: (context) => AlertDialog(
        elevation: 30,
        shadowColor: Colors.red,
        title: Text("Hi ${Provider.of<AuthController>(context,listen: false).username}"),
        content: Text("The weather of this day is worse for playing"),
      ),);
    }notifyListeners();
  }

  //get predict

}