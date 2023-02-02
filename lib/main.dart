import 'package:flutter/material.dart';
import 'package:movie2/provider/moviesprovider.dart';
import 'package:movie2/screens/onboardingscreen/onboardingscreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MoviesProvider())
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: OnBoarding(),
      debugShowCheckedModeBanner: false
    );

  }
}

