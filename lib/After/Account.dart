import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:samaki_app/After/Home.dart';
import 'package:samaki_app/Before/constacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool isLoading = false;

  String name = "null", phone = "null";
  int _id = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name")!;
      phone = prefs.getString("phone")!;
      _nameController.text = name;
      _id = prefs.getInt("id")!;
    });
  }

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

  Future<bool> _onWillPop  () async {
    return ( await
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Home())
        )
    )?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home())
                );
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
                    "Akaunti",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      fillColor: const Color.fromRGBO(238, 238, 238, 0.5),
                      enabled: false,
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      label: Text(
                        phone,
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
                        "Jina",
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
                        return "Jaza jina lako hapa!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: _nameController,
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
                          updateName(context);
                        }

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
                      const Text("Badili",
                          style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu')),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  void updateName(BuildContext context) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl+"updateName"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic> {
        'id': _id,
        'newName': _nameController.text
      })
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("name", _nameController.text);

      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Imebadili kikamilifu."),
            action: SnackBarAction(label: "Ok", onPressed: () {}),)
      );

    } else {
      showDialog(context: context, builder: (context) {
        return errorServer(context);
      });
      throw Exception("Error");
    }
  }

}
