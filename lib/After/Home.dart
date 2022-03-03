import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:samaki_app/After/Widgets/drawerView.dart';
import 'package:samaki_app/Utils/Widgets/HorizontalView.dart';
import 'package:samaki_app/Before/constacts.dart';

import 'package:http/http.dart' as http;
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _key = GlobalKey<ScaffoldState>();

  String? _name = "null";


  @override
  void initState() {
    super.initState();
    _getName();
  }

  void _getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("name");
    });
  }

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
                  _name!,
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
                child: FutureBuilder<List<article>>(
                  future: getNewArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return HorizontalView(
                                art: article(
                                  snapshot.data![index].title,
                                  snapshot.data![index].desc,
                                  snapshot.data![index].image,
                                  snapshot.data![index].id,
                                  snapshot.data![index].time,
                                ));
                          });
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const LoadingPostsList();
                  },
                ),
                // ),
              )
            ],
          ),
        ));
  }




}

Future<List<article>> getNewArticles() async {
  final response = await http.get(
      Uri.parse(baseUrl+"get_articles")
  );

  if (response.statusCode == 200) {

    var data = jsonDecode(response.body);
    List<article> articles = [];

    for (var singleArticle in data) {
      article Article = article(
        singleArticle['title'],
        singleArticle['description'],
        singleArticle['image'],
        singleArticle['id'],
        singleArticle['time']
      );

      articles.add(Article);
    }

    return articles;
  } else {
    throw Exception("Error");
  }
}
