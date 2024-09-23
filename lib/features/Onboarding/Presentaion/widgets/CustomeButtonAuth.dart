import 'package:flutter/material.dart';

class CustomeButtonAuth extends StatelessWidget {
   CustomeButtonAuth({super.key,required this.ontap,this.text,this.baclground,this.textcolor,this.top,this.bottom,this.right,this.left});
  String? text;
  final VoidCallback ontap;
  Color? textcolor,baclground;
  double? left,right,top,bottom;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: ontap, child: Text("$text",style: TextStyle(fontSize: 20,color: textcolor),),style: ElevatedButton.styleFrom(
        backgroundColor: baclground,
        padding: EdgeInsets.only(left:left!.toDouble(),right: right!.toDouble(),bottom: bottom!.toDouble(),top: top!.toDouble()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
    ),);
  }
}
