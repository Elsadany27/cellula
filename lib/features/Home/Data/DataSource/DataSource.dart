import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../../../core/utilities/constants.dart';
import '../../Presentation/Screens/provider/HomeController.dart';
import '../model/weathermodel.dart';

abstract class BaseDataSource{
  Future<WeatherData>? getForecastWether(context);
}
class DataModel extends BaseDataSource {
  Appconstants constants = Appconstants();
  // String? city;
  // Response? response;

  @override
  Future<WeatherData>? getForecastWether(context) async {
    if (Provider.of<HomeController>(context).city == null || Provider.of<HomeController>(context).city!.isEmpty) {
      print('City is null or empty');
      return null!; // Return null if the city is not set
    }

    Dio dio = Dio();
    String url = "${Appconstants.forecast}?q=${Provider.of<HomeController>(context,listen: false).city}&days=5&hour=0&key=${Appconstants.apikey}";
    dio.options.headers['Content-Type'] = "application/json";

    try {
     Response response = await dio.get(url);
      if (response!.statusCode == 200) {
        // Successfully received a valid response
        print(response!.data);
        return WeatherData.fromJson(response!.data);
      } else {
        // Handle errors based on the server response
        print('Request failed with status: ${response!.statusCode}.');
        print('Response data: ${response!.data}');
        return null!; // Return null on error
      }
    } catch (e) {
      if (e is DioException) {
        // Print detailed error information
        print('DioException: ${e.message}');
        if (e.response != null) {
          print('Response data: ${e.response!.data}');
          print('Response status code: ${e.response!.statusCode}');
        }
      } else {
        // Handle non-Dio exceptions
        print('Unexpected error: $e');
      }
      return null!; // Return null on catch
    }
  }


}