import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaki_app/Before/SignUp.dart';

class drawerView extends StatefulWidget {
  const drawerView({Key? key}) : super(key: key);

  @override
  _drawerViewState createState() => _drawerViewState();
}

class _drawerViewState extends State<drawerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(2,10),
                  spreadRadius: 5,
                  blurRadius: 1
                )
              ]
            ),
          ),
        ),
        Expanded(
          child: Material(
            child: ListView(
              children: [
                Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Nyumbani"),
                      dense: true,
                    ),
                    Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: ListTile(
                        leading: SvgPicture.asset("assets/add.svg", semanticsLabel: "account",),
                        title: const Text("Jisajili"),
                        dense: true,
                      ),
                    ),
                    Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: SvgPicture.asset("assets/signin.svg", semanticsLabel: "signin",),
                        title: const Text("Ingia"),
                        dense: true,
                      ),
                    ),
                    Divider()
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
