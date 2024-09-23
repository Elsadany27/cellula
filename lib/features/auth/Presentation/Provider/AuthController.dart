import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{
  //change state
  bool state =true;
  changeState(){
    if(state==true){
      state=false;
    }else{
      state=true;
    }notifyListeners();
  }
  //user name
  String? username;
}