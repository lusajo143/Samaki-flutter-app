import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samaki_app/After/Home.dart';
import 'package:samaki_app/Utils/Widgets/HorizontalView.dart';
import 'package:samaki_app/Before/Widgets/drawerView.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';

class HomeBefore extends StatefulWidget {
  const HomeBefore({Key? key}) : super(key: key);

  @override
  _HomeBeforeState createState() => _HomeBeforeState();
}

class _HomeBeforeState extends State<HomeBefore> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: IconButton(
            onPressed: () {
              _scaffoldState.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: textColor,
          ),
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


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Karibu,",
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
            child: FutureBuilder<List<article>>(
              future: getNewArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
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
                } else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                return const LoadingPostsList();
              },
            ),
          )
        ],
      ),
    );
  }

}
