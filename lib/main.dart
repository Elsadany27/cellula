import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish/features/profile/Presentation/provider/ProfileController.dart';
import 'features/Home/Presentation/Screens/provider/HomeController.dart';
import 'features/Onboarding/Presentaion/Screens/firstscreen.dart';
import 'features/auth/Presentation/Provider/AuthController.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController(),),
        ChangeNotifierProvider(create: (context) => HomeController(),),
        ChangeNotifierProvider(create: (context) => ProfileController(),),
      ],
      child:
      DevicePreview(
        enabled: true,
        builder: (context) =>
            ScreenUtilInit(
          designSize: Size(360,690),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FirstScreen(),
          ),
        ),
    ));
  }
}
