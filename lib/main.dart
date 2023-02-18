import 'package:flutter/material.dart';
import 'package:movie2/provider/moviesprovider.dart';
import 'package:movie2/provider/searchprovider.dart';
import 'package:movie2/screens/firstScreen/homepage/homepage.dart';
import 'package:movie2/screens/onboardingscreen/onboardingscreen.dart';
import 'package:movie2/screens/secondscreen/second_screen_details/second_screen_details.dart';
import 'package:movie2/screens/splashScreen/splashScreen.dart';
import 'package:movie2/screens/thirdScreen/third_screenDetails/Third_ScreenDetails.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MoviesProvider()),
    ChangeNotifierProvider(create: (context)=>Search())
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
    home:Splash(),
      debugShowCheckedModeBanner: false,
      routes: {
      "first":(context)=>HomePage(),
        "second":(context)=>Second_ScreenDetails(),
        "third":(context)=>Third_ScreenDetails()
      },
    );

  }
}
// OnBoarding()

