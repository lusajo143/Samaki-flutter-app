import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samaki_app/Before/Validate.dart';
import 'constacts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    primary: const Color.fromRGBO(134, 134, 134, 1),
    fixedSize: const Size(double.infinity, 55),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );


  final _key = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool isLoading = false;

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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingia",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Tafadhali ingiza namba yako ya simu.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
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
                    label: Text(
                      "Namba ya simu",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    filled: true,
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                    )),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                    )),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your phone number here";
                    }
                    // else if (value.length < 10) {
                    //   return "Enter valid phone number";
                    // }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {

                      if (!_key.currentState!.validate()) {
                        return;
                      }

                      if (!isLoading) {
                        setState(() {
                          isLoading = true;
                        });

                        singIn(context, _phoneController.text);
                      }

                      // singIn(context, _phoneController.text);
                    },
                    child: isLoading ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(right: 10),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Tafadhali subiri",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ) :
                    const Text("Ingia",
                      style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu')),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void singIn(BuildContext context, String phone) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl+"sign-in"),
      headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        'phone': phone
      })
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Validate(phone: phone))
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showDialog(context: context, builder: (context) {
        return errorServer(context);
      });
    }

  }

}
