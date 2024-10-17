import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/Home/Domain/Repo/HomeRepo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stylish/features/Home/Presentation/Screens/provider/HomeController.dart';

class HomeRepoImp extends HomeRepo{
  List<int>? predictData=[];
  @override
  //filter data
  filterData(String? textt, int? hummidty, int? maxtemp) {
    //rainy
    if(textt=='Patchy rain nearby'){
      predictData!.add(1);
    }else{
      predictData!.add(0);
    }
    //sunny
    if(textt=='Sunny'){
      predictData!.add(1);
    }else{
      predictData!.add(0);
    }
    //temp hot
    if(textt=='Sunny' && maxtemp!>30){
      predictData!.add(1);
    }else{
      predictData!.add(0);
    }
    //temp mild
    if(textt=='Clear' && maxtemp!<30){
      predictData!.add(1);
    }else{
      predictData!.add(0);
    }
    //hummidity
    if(hummidty!>70){
      predictData!.add(1);
    }else{
      predictData!.add(0);
    }
  }

  //get predict
  List? biprediction=[];
 @override
 Future<void> getPrediction(context) async {
   final url = Uri.parse('http://192.168.1.3:5001/predict');
   final Map<String, dynamic> body = {
     'features': predictData, // Assuming predictData is defined elsewhere
   };

   try {
     final response = await http.post(
       url,
       headers: {'Content-Type': 'application/json'},
       body: json.encode(body),
     );

     _handleResponse(response, body,context);
   } on http.ClientException catch (e) {
     _logDebug('ClientException: ${e.message}');
   } catch (e) {
     _logDebug('Error occurred: ${e.toString()}');
   }
 }

  void _handleResponse(http.Response response, Map<String, dynamic> body,context) {
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      Provider.of<HomeController>(context,listen: false).data=prediction;
      _logDebug('Prediction: ${prediction}');
      _logDebug('Request body: ${json.encode(body)}');
    } else {
      _handleError(response);
    }
  }

  void _handleError(http.Response response) {
    _logDebug('Failed to get prediction: ${response.statusCode} - ${response.reasonPhrase}');
  }

  void _logDebug(String message) {
    if (kDebugMode) {
      print(message);
    }
  }

}