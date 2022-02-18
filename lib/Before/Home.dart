import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samaki_app/Before/Widgets/HorizontalView.dart';
import 'package:samaki_app/Before/Widgets/drawerView.dart';

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
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  child: InkWell(
                    child: const Image(image: AssetImage("assets/Menu.png")),
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                const Text(
                  "Samaki App",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,
                  fontFamily: 'Ubuntu'),
                )
              ],
            ),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          ),
          const TextField(
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
                hintText: "Tafuta",
                focusColor: Color.fromRGBO(238, 238, 238, 100),
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(238, 238, 238, 100),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 100),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                fillColor: Color.fromRGBO(238, 238, 238, 100),
                filled: true),
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
