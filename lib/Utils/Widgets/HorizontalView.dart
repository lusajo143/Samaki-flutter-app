import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';

class HorizontalView extends StatefulWidget {
  final article art;

  const HorizontalView({Key? key, required this.art}) : super(key: key);

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
                image: NetworkImage(widget.art.image),
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
                      widget.art.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18,
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
                        const Icon(Icons.access_time_rounded,
                          size: 12,
                          color: Color.fromRGBO(134, 134, 134, 100),),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text(
                            widget.art.time.toString(),
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