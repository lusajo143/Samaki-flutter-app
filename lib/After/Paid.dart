import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/HorizontalView.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Paid extends StatefulWidget {
  const Paid({Key? key}) : super(key: key);

  @override
  _PaidState createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: textColor,
          ),
        ),
        title: Text("Nyuma", style: Theme.of(context).textTheme.subtitle1),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Zilizolipiwa",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: FutureBuilder<List<article>>(
                future: _getPaidArticles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return HorizontalView(art: snapshot.data![index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<article>> _getPaidArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.post(
        Uri.parse(baseUrl + "getPaidArticles"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body:
            jsonEncode(<String, String>{'id': prefs.getInt("id").toString()}));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      List<article> _list = [];
      for (var data in responseJson) {
        _list.add(article(data['title'], data['description'], data['image'],
            data['id'], data['time']));
      }
      return _list;
    } else {
      throw Exception("Error");
    }
  }
}
