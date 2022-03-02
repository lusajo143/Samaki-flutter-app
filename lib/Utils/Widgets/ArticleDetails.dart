import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/LoadingArticleDetails.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArticleDetails extends StatefulWidget {
  final int articleId;

  const ArticleDetails({Key? key, required this.articleId}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {


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
      body: FutureBuilder<article2>(
        future: getArticleDetails(context, 1, widget.articleId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DetailedArticle(
              title: snapshot.data!.title,
              desc: snapshot.data!.desc,
              image: snapshot.data!.image,
              id: snapshot.data!.id.toString(),
              time: snapshot.data!.time.toString(),
              paid: snapshot.data!.paid,
            );
          } else if (snapshot.hasError) {
            return const Text(
              "Kuna tatizo la kimtandao!",
              style: TextStyle(color: Colors.red),
            );
          }
          return const LoadingArticleDetails();
        },
      ),
      // body: !isLoading ?
      // const LoadingArticleDetails() :
      // const DetailedArticle(),
    );
  }

  Future<article2> getArticleDetails(
      BuildContext context, int userId, int articleId) async {
    http.Response response = await http.post(
        Uri.parse(baseUrl + "get_articles_details"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "user_id": userId.toString(),
          "article_id": articleId.toString()
        }));

    if (response.statusCode == 200) {
      return article2.toJson(jsonDecode(response.body));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return errorServer(context);
          });
      throw Exception("Server error");
    }
  }


}

class DetailedArticle extends StatefulWidget {
  final String title, desc, image, id, time;
  final bool paid;

  const DetailedArticle({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    required this.id,
    required this.time,
    required this.paid,
  }) : super(key: key);

  @override
  _DetailedArticleState createState() => _DetailedArticleState();
}

class _DetailedArticleState extends State<DetailedArticle> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 12,
                  color: Color.fromRGBO(134, 134, 134, 100),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    widget.time,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(134, 134, 134, 100)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                widget.image,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: Stack(
                      children: const [
                        shadowView(width: double.infinity, height: 400),
                        Center(
                          child: CircularProgressIndicator(
                            color: textColor,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                widget.desc,
                maxLines: 15,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            widget.paid ?
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    "Kumalizia kusoma",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Text(
                    "Tafadhali lipia",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString("id", "hshs");
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text(
                            "M-pesa",
                            style: TextStyle(fontFamily: 'Ubuntu'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? value = prefs.getString("id");
                            showDialog(context: context, builder: (context) => errorAlert(context, value!));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: const Text(
                            "Tigo pesa",
                            style: TextStyle(fontFamily: 'Ubuntu'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ): Container()
          ],
        ),
      ),
    );
  }
}
