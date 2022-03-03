import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:samaki_app/After/Paid.dart';
import 'package:samaki_app/Before/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:samaki_app/Before/HomeBefore.dart';

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
          child: Stack(
            children: [
              const Image(image: NetworkImage("https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text("Samaki app",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Ubuntu'
                  ),),
                padding: EdgeInsets.all(20),
              )
            ],
          ),
        ),
        Expanded(
          child: Material(
            child: ListView(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: const ListTile(
                        leading: Icon(Icons.home, color: Colors.black,size: 30,),
                        title: Text("Nyumbani",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                              fontSize: 15
                          ),),
                        dense: true,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Paid()));
                      },
                      child: ListTile(
                        leading: SvgPicture.asset("assets/article.svg", semanticsLabel: "paid article", color: const Color.fromRGBO(
                            83, 83, 83, 1.0),),
                        title: Text("Zilizolipiwa",
                            style: Theme.of(context).textTheme.bodyText1
                        ),
                        dense: true,
                      ),
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.account_circle_outlined, color: Color.fromRGBO(
                            83, 83, 83, 1.0),),
                        title: Text("Akaunti",
                            style: Theme.of(context).textTheme.bodyText1
                        ),
                        dense: true,
                      ),
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove("id");
                        prefs.remove("phone");
                        prefs.remove("name");
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const HomeBefore()));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.logout, color: Color.fromRGBO(
                            83, 83, 83, 1.0)
                        ),
                        title: Text("Ondoka",
                            style: Theme.of(context).textTheme.bodyText1
                        ),
                        dense: true,
                      ),
                    ),
                    const Divider()
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
