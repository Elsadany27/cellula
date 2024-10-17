import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:stylish/features/Home/Presentation/Screens/Weatherdetails/WeatherDetailsPage.dart';
import 'package:stylish/features/Home/Presentation/Screens/provider/HomeController.dart';
import 'package:stylish/features/auth/Presentation/Provider/AuthController.dart';
import 'package:stylish/features/profile/Presentation/provider/ProfileController.dart';
import '../../../../core/utilities/constants.dart';
import '../../../auth/Presentation/Widgets/CustomeTextFormField.dart';
import '../../../profile/Presentation/screens/ProfilePage.dart';
import '../../Data/DataSource/DataSource.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  DataModel dataModel = DataModel();
  TextEditingController destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Container(
            height: double.infinity, // Use full height for better responsiveness
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h), // Responsive padding
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Image (1).png"),
                  fit: BoxFit.fill
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Hello",
                      style: TextStyle(
                          color: Appconstants.color,
                          fontSize: 30.sp, // Responsive font size
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      "${Provider.of<AuthController>(context).username}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp, // Responsive font size
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ProfilePage()),
                          );
                        },
                        child: provider.urlimage == null
                            ? CircleAvatar(
                          backgroundImage: AssetImage("images/7229a2262762.5ec41fb7d6398-removebg-preview-removebg-preview.png"),
                          radius: 25.r, // Responsive radius
                        )
                            : CircleAvatar(
                          backgroundImage: NetworkImage("${provider.urlimage}"),
                          radius: 25.r, // Responsive radius
                        )
                    ),
                  ),
                  // Map Container
                  Container(
                    margin: EdgeInsets.only(top: 40.h), // Responsive margin
                    height:300.h, // Responsive height
                    child: FlutterLocationPicker(
                      selectLocationButtonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      selectLocationButtonText: 'Set Current Location',
                      initPosition: LatLong(30.4625, 31.183899),
                      selectLocationButtonLeadingIcon: const Icon(Icons.check),
                      initZoom: 11,
                      minZoomLevel: 5,
                      maxZoomLevel: 16,
                      trackMyPosition: true,
                      onError: (e) => print(e),
                      onPicked: (pickedData) {
                        print(pickedData.address);
                        print(pickedData.addressData['country']);
                        Provider.of<HomeController>(context, listen: false).city = pickedData.address;
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WeatherDetailsPage()),
                        );
                      },
                    ),
                  ),
                  // Text Form Field
                  SizedBox(height: 80.h), // Responsive height
                  CustomeTextFormField(
                    text: "Set Location",
                    controller: destination,
                  ),
                  SizedBox(height: 10.h), // Responsive height
                  // Search Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appconstants.color,
                    ),
                    onPressed: () {
                      Provider.of<HomeController>(context, listen: false).city = destination.text;
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => WeatherDetailsPage()),
                      );
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp, // Responsive font size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}