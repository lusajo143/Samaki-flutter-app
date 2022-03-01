
import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/LoadingArticleDetails.dart';


class ArticleDetails extends StatefulWidget {

  final int id;

  const ArticleDetails({Key? key, required this.id}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {

  bool isLoading = true;



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
      body: !isLoading ?
      const LoadingArticleDetails() :
      DetailedArticle(),
    );
  }
}

class DetailedArticle extends StatefulWidget {

  // final article art;

  const DetailedArticle({Key? key,}) : super(key: key);

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
              "Heading",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                const Icon(Icons.access_time_rounded,
                  size: 12,
                  color: Color.fromRGBO(134, 134, 134, 100),),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: const Text(
                    "time",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(134, 134, 134, 100)
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network("http://10.42.0.1:5000/images/cover.jpg",),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam maecenas ultricies mi eget mauris. Vitae purus faucibus ornare suspendisse sed nisi lacus sed. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. Quam id leo in vitae turpis massa sed elementum. Elementum curabitur vitae nunc sed. Vivamus at augue eget arcu. Vestibulum sed arcu non odio euismod lacinia at. Nunc vel risus commodo viverra maecenas accumsan lacus. Orci nulla pellentesque dignissim enim. Fusce id velit ut tortor pretium viverra suspendisse potenti. Dictum at tempor commodo ullamcorper a lacus. Aliquam nulla facilisi cras fermentum odio eu feugiat pretium. In ante metus dictum at tempor. Amet nisl purus in mollis nunc sed id. Blandit libero volutpat sed cras. Eu augue ut lectus arcu bibendum at. Arcu bibendum at varius vel pharetra vel.",
                maxLines: 4,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    "Kumalizia kusoma",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Text(
                      "Tafadhali lipia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text(
                            "M-pesa",
                            style: TextStyle(
                                fontFamily: 'Ubuntu'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          child: const Text(
                            "Tigo pesa",
                            style: TextStyle(
                                fontFamily: 'Ubuntu'
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
