import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: Row(
              children: [
                Material(
                  child: InkWell(
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
