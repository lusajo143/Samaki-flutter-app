import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samaki_app/After/Home.dart';
import 'package:samaki_app/Before/HomeBefore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int _id = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkSignIn();
    startTimer();
  }

  void _checkSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("id") != 0) {
      setState(() {
        _id = prefs.getInt("id")!;
      });
    }
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      _id == 0
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomeBefore()))
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
