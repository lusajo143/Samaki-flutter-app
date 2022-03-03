import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/ArticleDetails.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';

class HorizontalView extends StatefulWidget {
  final article art;

  const HorizontalView({Key? key, required this.art}) : super(key: key);

  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {

  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              size == 100 ?
              setState(() {
                size = MediaQuery.of(context).size.width - 40;
              }) :
              setState(() {
                size = 100;
              });
            },
            child: AnimatedContainer(
              margin: const EdgeInsets.only(top: 5),
              duration: const Duration(milliseconds: 100),
              width: size,
              height: size,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(widget.art.image),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loading) {
                    if (loading == null) return child;
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        children: const [
                          shadowView(width: 100, height: 100),
                          Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: textColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ArticleDetails(articleId: widget.art.id)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.art.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.art.desc,
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            const Flexible(child: Icon(
                              Icons.access_time_rounded,
                              size: 12,
                              color: Color.fromRGBO(134, 134, 134, 100),
                            )),
                            Flexible(child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                widget.art.time.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(134, 134, 134, 100)),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class post {
  String image, title, content, time;
  post(this.image, this.title, this.content, this.time);
}
