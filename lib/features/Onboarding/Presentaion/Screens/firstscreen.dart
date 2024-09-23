import 'package:flutter/material.dart';
import 'package:stylish/features/Onboarding/Presentaion/Screens/secoundscreen.dart';

import '../widgets/CustomeButtonAuth.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 900,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/j-schiemann-Z4Sxy1_3wdY-unsplash.png"),fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 450,),
            Text("Meet your Court Partner!",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,)),SizedBox(height: 30,),
            Text("The perfect opportunity to meet \npeople and find your perfect \ntennis partner.",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
            //button
            SizedBox(height: 70,),
            Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecoundScreen(),));
              }, child:Text("Next",style: TextStyle(fontSize: 18,color:  Color(0xff192B59),),),style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor:Colors.white,
                  padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10)
              ),),
            )
        ],),
      ),
    );
  }
}
