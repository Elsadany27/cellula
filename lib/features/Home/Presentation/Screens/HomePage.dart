import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 30,),
        color: Color(0xff014BB4),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //welcome text
          Row(
            children: [
              Text("Hi ",style: TextStyle(color: Colors.white,fontSize: 30),),
              Text("Youssef Elsadany",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],
          )

        ],),
      ),
    );
  }
}
