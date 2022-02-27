import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';


class LoadingPostsList extends StatefulWidget {
  const LoadingPostsList({Key? key}) : super(key: key);

  @override
  _LoadingPostsListState createState() => _LoadingPostsListState();
}

class _LoadingPostsListState extends State<LoadingPostsList> {

  static const _list = ["","", "", ""];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shadowView(width: 100, height: 100),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        shadowView(width: double.infinity, height: 18),
                        SizedBox(height: 2,),
                        shadowView(width: double.infinity, height: 18),
                        SizedBox(height: 2,),
                        shadowView(width: double.infinity, height: 18),
                        SizedBox(height: 2,),
                        shadowView(width: double.infinity, height: 18),
                        SizedBox(height: 2,),
                        shadowView(width: double.infinity, height: 18),
                        SizedBox(height: 2,),
                        shadowView(width: 100, height: 12),
                        Divider()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class shadowView extends StatelessWidget {

  final double width, height;

  const shadowView({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: whiteFade,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}


