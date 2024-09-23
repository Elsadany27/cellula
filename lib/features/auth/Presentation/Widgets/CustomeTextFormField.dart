import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
   CustomeTextFormField({super.key,this.controller});
   TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white,fontSize: 15),
      validator: (value) {
        if(value!.isEmpty){
          return "Field is empty";
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff23314C),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Color(0xff23314C),width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Color(0xff23314C),width: 1)
        ),
      ),
    );
  }
}
