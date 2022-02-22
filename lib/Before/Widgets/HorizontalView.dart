import 'package:flutter/material.dart';

class HorizontalView extends StatefulWidget {
  final post;

  const HorizontalView({Key? key, this.post}) : super(key: key);

  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(widget.post.image),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      widget.post.content,
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded,
                          size: 12,
                          color: Color.fromRGBO(134, 134, 134, 100),),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            widget.post.time,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(134, 134, 134, 100)
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class post {
  String image, title, content, time;
  post(this.image, this.title, this.content, this.time);
}
