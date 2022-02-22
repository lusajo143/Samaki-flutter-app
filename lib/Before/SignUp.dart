import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    textStyle: TextStyle(fontWeight: FontWeight.bold),
    primary: const Color.fromRGBO(134, 134, 134, 1),
    fixedSize: const Size(double.infinity, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 5)
            ]),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Container(
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 20, color: Colors.black,
                    fontFamily: 'Ubuntu'),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jisajili",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Text(
                    "Tafadhali jaza taarifa zako ili kuendelea.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                 TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(86, 86, 86, 100),
                    )),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    labelStyle: const TextStyle(color: Colors.black,),
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    fillColor: const Color.fromRGBO(238, 238, 238, 0.5),
                    hintText: "e.g Jon Doe",
                    label: Text("Jina lako",
                    style: Theme.of(context).textTheme.bodyText1,),
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(86, 86, 86, 100),
                    )),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: const Color.fromRGBO(238, 238, 238, 0.5),
                    hintText: "e.g +255744851335",
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    label: Text("Namba ya simu",
                    style: Theme.of(context).textTheme.bodyText1,),
                    filled: true,
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Jisajili",
                    style: TextStyle(
                      fontFamily: 'Ubuntu'
                    ),),
                    style: raisedButtonStyle,
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
