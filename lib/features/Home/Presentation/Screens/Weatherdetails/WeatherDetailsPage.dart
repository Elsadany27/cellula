import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/Home/Data/DataSource/DataSource.dart';

import '../provider/HomeController.dart';

class WeatherDetailsPage extends StatelessWidget {
   WeatherDetailsPage({super.key});
  DataModel datamodel=DataModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: datamodel.getForecastWether(context),
        builder: (context, snapshot) => snapshot.hasData?Stack(children: [
          //first conrainer back image
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/Image (1).png"),fit: BoxFit.fill)),),
          //house image
          Center(child: Image.asset("images/House 4 3 (1).png",width: 250,height: 300,)),
          //weather details
          Column(children: [
            //current weather
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 450,
              child: Column(
                children: [
                  Text("${snapshot.data!.location!.name}",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w400),),
                  Text("${snapshot.data!.current!.tempC!.round()}°",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                  Text("${snapshot.data!.current!.condition!.text}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w100),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("H:${snapshot.data!.forecast!.forecastday?[0].day?.maxtempC!.round()}°",style: TextStyle(fontSize: 20,color: Colors.white),),SizedBox(width: 10,),
                    Text("L:${snapshot.data!.forecast!.forecastday?[0].day?.mintempC!.round()}°",style: TextStyle(fontSize: 20,color: Colors.white)),
                  ],),
                  Image.network("https:${snapshot.data!.current!.condition!.icon}",height: 50,color: Colors.yellowAccent,),
                ],),),

            Container(
              padding: EdgeInsets.only(top: 10,bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                gradient: LinearGradient(colors: [Color(0xff713884),Color(0xff313057),Color(0xff713884),Color(0xff313057),],begin: Alignment.topLeft,end: Alignment.bottomLeft)
              ),
              height: 283,
              child: Column(
                children: [
                  Text("Weekly Forecast",style: TextStyle(color:Colors.white38,fontSize: 15,fontWeight: FontWeight.w400),),
                  Divider(thickness: 2,color: Colors.white12,),SizedBox(height: 30,),
                  Container(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          margin: EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                          color: Color(0xff313057),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Text("${snapshot.data!.forecast!.forecastday![index].date!.characters.last} Octobor",style: TextStyle(color: Colors.white),),SizedBox(height: 15,),
                              Text("${snapshot.data!.forecast!.forecastday![index].day!.maxtempC!.round()}°",style: TextStyle(color: Colors.white),),
                              Image.network("https:${snapshot.data!.forecast!.forecastday![index].day!.condition!.icon}",height: 40,color: Colors.white,),
                              Text("${snapshot.data!.forecast!.forecastday![index].day!.mintempC!.round()}°",style: TextStyle(color: Colors.white),),
                            ],),
                          ),
                        ),),
                  ),
                ],
              ),
            )
          ],)
        ],):snapshot.hasError?Text("${snapshot.error}"):Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
