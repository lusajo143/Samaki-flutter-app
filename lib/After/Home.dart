import 'package:flutter/material.dart';
import 'package:samaki_app/After/Widgets/drawerView.dart';
import 'package:samaki_app/Before/Widgets/HorizontalView.dart';
import 'package:samaki_app/Before/constacts.dart';

class Home extends StatefulWidget {
  final String phone;
  const Home({Key? key, required this.phone}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _list = ["h", "k"];

  final _key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: textColor,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: textColor,
                ))
          ],
        ),

        drawer: const Drawer(
          child: drawerView(),
        ),

        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                alignment: Alignment.centerLeft,
                child: Text("Karibu,",
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jon Doe",
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
                          offset: Offset(2, 2),
                          blurRadius: 10)
                    ]),
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
                  itemBuilder: (context, index) {
                    return HorizontalView(
                      post: post(
                          "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
                          "title",
                          "Lorem ipsum dolor sit amet, ullum mundi qui an. Doctus labitur iuvaret eu per. Nam cu porro paulo. Duis porro utamur in ...",
                          "time"),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
