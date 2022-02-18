import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home1(),
      drawer: Drawer(
        child: Container(
          child: Text("data"),
        ),
      ),
    );
  }
}


class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldState.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Image(image: AssetImage("assets/Menu.png")),
              Text("Samaki App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),)
            ],
          ),
          margin: const EdgeInsets.fromLTRB(30, 60, 30, 70),
        )
      ],
    );
  }
}

