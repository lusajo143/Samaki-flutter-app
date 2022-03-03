import 'package:flutter/material.dart';
import 'package:samaki_app/After/Home.dart';

import 'package:samaki_app/Before/constacts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Validate extends StatefulWidget {
  final String phone, name;
  final int id;
  const Validate({Key? key, required this.phone, required this.id, required this.name}) : super(key: key);

  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {

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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Uhakiki",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingiza namba zilizotumwa kwenye namba " + widget.phone,
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
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                hintStyle: Theme.of(context).textTheme.bodyText1,
                fillColor: const Color.fromRGBO(238, 238, 238, 0.5),
                hintText: "-   -   -   -",
                filled: true,
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  letterSpacing: 10, fontFamily: 'Ubuntu', fontSize: 15),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () async {
                
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("phone", widget.phone);
                prefs.setInt("id", widget.id);
                prefs.setString("name", widget.name);
                // prefs.setString("key", value)
                
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Home())
                );
                
              },
                child: const Text("Hakiki",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu'
                  ),
                ),
                style: raisedButtonStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
