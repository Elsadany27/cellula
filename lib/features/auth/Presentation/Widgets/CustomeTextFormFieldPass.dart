import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/AuthController.dart';

class CustomeTextFormFieldPass extends StatelessWidget {
  CustomeTextFormFieldPass({super.key,this.controller});
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, provider, child) {
        return TextFormField(
          controller: controller,
          obscureText: provider.state,
          style: TextStyle(color: Colors.white, fontSize: 15),
          validator: (value) {
            if (value!.isEmpty) {
              return "Field is empty";
            }
            if (value.length <= 8) {
              return "Password less than 8";
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: () {provider.changeState();},
              icon: Icon(Icons.visibility_outlined, color: Colors.white,),),
            filled: true,
            fillColor: Color(0xff23314C),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Color(0xff23314C), width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Color(0xff23314C), width: 1)
            ),
          ),
        );
      },
    );
  }
}
