import 'package:flutter/material.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:samaki_app/Utils/Widgets/LoadingPostsList.dart';



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
            const Expanded(
              child: LoadingPostsList(),
            )
          ],
        ),
      ),
    );
  }
}
