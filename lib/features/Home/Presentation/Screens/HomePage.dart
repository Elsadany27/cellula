import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/Home/Presentation/Screens/Weatherdetails/WeatherDetailsPage.dart';
import 'package:stylish/features/Home/Presentation/Screens/provider/HomeController.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

import '../../../../core/utilities/constants.dart';
import '../../../auth/Presentation/Widgets/CustomeTextFormField.dart';
import '../../Data/DataSource/DataSource.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   DataModel datamodel=DataModel();
   TextEditingController destination=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 850,
        padding: EdgeInsets.only(left: 20,right: 20,top: 40),decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/Image (1).png"),fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title:Text("Hello",style: TextStyle(color: Appconstants.color,fontSize: 30,fontWeight: FontWeight.bold),),
              subtitle:Text("${Provider.of<AuthController>(context).username}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.horizontal_split,color: Colors.white,size: 30,),
            ),
          //map
          Container(
            margin: EdgeInsets.only(top: 40,),
              height: 350,
              child: FlutterLocationPicker(
                selectLocationButtonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                selectLocationButtonText: 'Set Current Location',
                initPosition: LatLong(30.4625,31.183899),
                selectLocationButtonLeadingIcon: const Icon(Icons.check),
                initZoom: 11,
                minZoomLevel: 5,
                maxZoomLevel: 16,
                trackMyPosition: true,
                onError: (e) => print(e),
                onPicked: (pickedData) {
                  print(pickedData.address);
                  print(pickedData.addressData['country']);
                  Provider.of<HomeController>(context,listen: false).city=pickedData.address;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherDetailsPage(),));

                },)),
          //textform
          SizedBox(height: 80,),
          CustomeTextFormField(text: "Set Location",controller:destination,),SizedBox(height: 10,),
            //button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appconstants.color,
                ),
                onPressed: (){
                  Provider.of<HomeController>(context,listen: false).city=destination.text;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherDetailsPage(),));
                }, child:Text("Search",style: TextStyle(color: Colors.white,fontSize: 15),)),
        ],),
      ),
      ),
    );
  }
}
