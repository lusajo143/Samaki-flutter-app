import 'package:flutter/material.dart';
import 'package:samaki_app/Before/Splash.dart';
import 'package:samaki_app/Before/constacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samaki App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: primaryColor,
          ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 35,
          fontFamily: 'Ubuntu'
        ),
        bodyText2: TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
          fontFamily: 'Ubuntu',
          fontSize: 15
        ),
        bodyText1: TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
            fontFamily: 'Ubuntu',
          fontSize: 15,
          height: 1.4
        ),
        subtitle1: TextStyle(
          color: textColor,
          fontFamily: 'Ubuntu',
          fontSize: 20
        ),
      )),
      home: const Splash(),
    );
  }
}
