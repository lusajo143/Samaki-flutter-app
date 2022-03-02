import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samaki_app/After/Home.dart';
import 'package:samaki_app/Before/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? _id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkSignIn();
    startTimer();
  }

  void _checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.getString("id")!.isEmpty) {
      _id = prefs.getString("id");
    } else {
      _id = "null";
    }
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      _id == "null"
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const SignIn()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: const Image(
              image: AssetImage("assets/bg.png"),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/logo.png"),
                  width: 50,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text("Samaki App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
