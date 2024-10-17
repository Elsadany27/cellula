import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/Home/Data/DataSource/DataSource.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';

import '../../../../../core/utilities/constants.dart';
import '../../../Data/RepoImp/HomeRepoImp.dart';
import '../provider/HomeController.dart';

class WeatherDetailsPage extends StatelessWidget {
   WeatherDetailsPage({super.key});
  DataModel datamodel=DataModel();
  HomeRepoImp homerepoimp=HomeRepoImp();
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
          Center(child: Image.asset("images/House 4 3 (1).png",width: 280,)),
          //weather details
          Column(children: [
            //current weather
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 450,
              child: Column(
                children: [
                  Center(child: Text("${snapshot.data!.location!.name}",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w400),)),
                  Center(child: Text("${snapshot.data!.current!.tempC!.round()}°",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),)),
                  Center(child: Text("${snapshot.data!.current!.condition!.text}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w100),)),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("H:${snapshot.data!.forecast!.forecastday?[0].day?.maxtempC!.round()}°",style: TextStyle(fontSize: 20,color: Colors.white),),SizedBox(width: 10,),
                    Text("L:${snapshot.data!.forecast!.forecastday?[0].day?.mintempC!.round()}°",style: TextStyle(fontSize: 20,color: Colors.white)),
                  ],),
                  Image.network("https:${snapshot.data!.current!.condition!.icon}",height: 50,color: Colors.yellowAccent,),
                ],),),
            //forecast
            Container(
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                gradient: LinearGradient(colors: [Color(0xff713884),Color(0xff313057),Color(0xff713884),Color(0xff313057),],begin: Alignment.topLeft,end: Alignment.bottomLeft)
              ),
              height: 283,
              child: ListView(
                children: [
                  Center(child: Text("3 Days Forecast",style: TextStyle(color:Colors.white38,fontSize: 15,fontWeight: FontWeight.w400),)),
                  Divider(thickness: 2,color: Colors.white12,),SizedBox(height: 10,),
                  Container(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) => Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          margin: EdgeInsets.only(left: 15,right: 30,bottom: 5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                          color: Color(0xff313057),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                homerepoimp.filterData("${snapshot.data!.forecast!.forecastday![index].day!.condition!.text}",
                                    snapshot.data!.forecast!.forecastday![index].day!.avghumidity!.toInt(), snapshot.data!.forecast!.forecastday![index].day!.maxtempC!.toInt());
                                print(homerepoimp.predictData);
                                homerepoimp.getPrediction(context);

                                //alret dialoge
                                Provider.of<HomeController>(context,listen: false).predictResult(context);
                              },
                              child: Column(children: [
                                Text("${snapshot.data!.forecast!.forecastday![index].date!} ",style: TextStyle(color: Colors.white,fontSize: 12),),SizedBox(height: 15,),
                                Text("${snapshot.data!.forecast!.forecastday![index].day!.maxtempC!.round()}°",style: TextStyle(color: Colors.white),),
                                Image.network("https:${snapshot.data!.forecast!.forecastday![index].day!.condition!.icon}",height: 40,color: Colors.white,),
                                Text("${snapshot.data!.forecast!.forecastday![index].day!.mintempC!.round()}°",style: TextStyle(color: Colors.white),),
                              ],),
                            ),
                          ),
                        ),),
                  ),SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Color(0xff313057)
                        ),
                        onPressed: (){
                          homerepoimp.filterData("${snapshot.data!.current!.condition!.text}",
                              snapshot.data!.current!.humidity!.toInt(), snapshot.data!.forecast!.forecastday![0].day!.mintempC!.toInt());
                          print(homerepoimp.predictData);
                          homerepoimp.getPrediction(context);
                        }, child:Text("Predict",style: TextStyle(color: Colors.white),)),
                  ),
                ],),),
          ],)
        ],):snapshot.hasError?Text("${snapshot.error}"):Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
