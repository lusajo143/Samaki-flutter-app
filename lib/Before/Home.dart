import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samaki_app/Before/Widgets/HorizontalView.dart';
import 'package:samaki_app/Before/Widgets/drawerView.dart';
import 'package:samaki_app/Before/constacts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: textColor,
        ),
      ),
      body: home1(
        scaffoldKey: _scaffoldState,
      ),
      drawer: const Drawer(
        child: drawerView(),
      ),
    );
  }
}

class home1 extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  home1({Key? key, required this.scaffoldKey}) : super(key: key);

  var _list = ["hello", "h"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome",
              style: Theme.of(context).textTheme.bodyText2
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Samaki App",
              style: Theme.of(context).textTheme.headline1,
            ),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          ),

          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2,2),
                  blurRadius: 10
                )
              ]
            ),
            child: TextField(
                decoration: InputDecoration(
                  hintText: "Tafuta",
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Mpya",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _list.length,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                itemBuilder: (context, index) {
                  return HorizontalView(
                      post: post(
                          "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
                          "title",
                          "Lorem ipsum dolor sit amet, ullum mundi qui an. Doctus labitur iuvaret eu per. Nam cu porro paulo. Duis porro utamur in ...",
                          "time"));
                }),
          )
        ],
      ),
    );
  }
}
