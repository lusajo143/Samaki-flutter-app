import 'package:flutter/material.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';


class LoadingArticleDetails extends StatefulWidget {
  const LoadingArticleDetails({Key? key}) : super(key: key);

  @override
  _LoadingArticleDetailsState createState() => _LoadingArticleDetailsState();
}

class _LoadingArticleDetailsState extends State<LoadingArticleDetails> {


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const shadowView(width: double.infinity, height: 25),
        const SizedBox(height: 10,),
        const shadowView(width: 100, height: 12),
        const SizedBox(height: 10,),
        const shadowView(width: double.infinity, height: 400),
        const SizedBox(height: 10,),
        const shadowView(width: double.infinity, height: 15),
        const SizedBox(height: 10,),
        const shadowView(width: double.infinity, height: 15),
        const SizedBox(height: 10,),
        const shadowView(width: double.infinity, height: 15),
        const SizedBox(height: 10,),
        shadowView(width: (size.width * 0.5), height: 15),
        const SizedBox(height: 10,),
      ],
    );
  }
}

