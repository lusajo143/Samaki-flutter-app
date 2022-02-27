import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:samaki_app/Before/Validate.dart';
import 'package:http/http.dart' as http;

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
    fixedSize: const Size(double.infinity, 55),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Form(
              key: _key,
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
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      fillColor: const Color.fromRGBO(238, 238, 238, 0.5),
                      hintText: "e.g Jon Doe",
                      label: Text(
                        "Jina lako",
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
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name here!";
                      } else {
                        return null;
                      }
                    },
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
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: (value) {
                      return value!.isEmpty ? "Enter phone number here" : null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {

                        if (!isLoading) {
                          if (!_key.currentState!.validate()) {
                            return;
                          }

                          setState(() {
                            isLoading = true;
                          });

                          await register(
                              context, nameController.text, phoneController.text);
                        } else {
                          return;
                        }
                      },
                      child: isLoading
                          ? Row(
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
                            )
                          : const Text(
                              "Jisajili",
                              style: TextStyle(fontFamily: 'Ubuntu'),
                            ),
                      style: raisedButtonStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> register(BuildContext context, String name, String phone) async {
    final response = await http.post(Uri.parse(baseUrl + "sign-up"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'name': name, 'phone': phone}));

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Validate(phone: phone)));
    } else {
      setState(() {
        isLoading = false;
      });
      showDialog(context: context, builder: (context) => errorAlert(context, errorMessage.toJson(jsonDecode(response.body)).message));
    }
  }
}
