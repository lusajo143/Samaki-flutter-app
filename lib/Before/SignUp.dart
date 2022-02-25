import 'package:flutter/material.dart';
import 'package:samaki_app/Before/Validate.dart';

import 'constacts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    primary: const Color.fromRGBO(134, 134, 134, 1),
    fixedSize: const Size(double.infinity, 45),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios,
            color: textColor,),
        ),

        title: Text("Nyuma",
            style: Theme.of(context).textTheme.subtitle1),

      ),
      body: Column(
        children: [
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
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Validate(phone: phoneController.text,))
                      );
                    },
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
