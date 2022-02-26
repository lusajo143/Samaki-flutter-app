import 'package:flutter/material.dart';



class Paid extends StatefulWidget {
  const Paid({Key? key}) : super(key: key);

  @override
  _PaidState createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Paid"),
      ),
    );
  }
}
