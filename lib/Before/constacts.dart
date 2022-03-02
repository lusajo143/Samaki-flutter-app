import 'dart:ui';

import 'package:flutter/material.dart';

const textColor = Color(0xFF151026);
const primaryColor = Color(0xFFFAFAFA);
const whiteFade = Color(0xFFEBEBEB);

const String baseUrl = "http://10.42.0.1:5000/";

AlertDialog errorAlert(BuildContext context, String message) {
  return AlertDialog(
    content: Wrap(
      alignment: WrapAlignment.center,
      children: [
        Column(
          children: [
            const Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        )
      ],
    ),
  );
}


AlertDialog errorNetwork(BuildContext context) {
  return AlertDialog(
    content: Wrap(
      alignment: WrapAlignment.center,
      children: [
        Column(
          children: [
            const Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            ),
            Text(
              "Hakuna mtandao\nTafadhari jaribu tena.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        )
      ],
    ),
  );
}


AlertDialog errorServer(BuildContext context) {
  return AlertDialog(
    content: Wrap(
      alignment: WrapAlignment.center,
      children: [
        Column(
          children: [
            const Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            ),
            Text(
              "Kuna tatizo la kiufundi\nTafadhari jaribu tena baadae.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        )
      ],
    ),
  );
}


class errorMessage {
  final String message;

  const errorMessage({ required this.message});

  factory errorMessage.toJson(Map<String, dynamic> json) {
    return errorMessage(message: json['message']);
  }
}


class article {
  final String title, desc, image;
  final int id, time;

  article(this.title, this.desc, this.image, this.id, this.time);

  factory article.toJson(Map<String, dynamic> json) {
    return article(
      json['title'],
      json['desc'],
      json['image'],
      json['id'],
      json['time']
    );
  }

}

class article2 {
  final String title, desc, image;
  final int id, time;
  final bool paid;

  article2(this.title, this.desc, this.image, this.id, this.time, this.paid);

  factory article2.toJson(Map<String, dynamic> json) {
    return article2(
        json['title'],
        json['desc'],
        json['image'],
        json['id'],
        json['time'],
      json['paid']
    );
  }

}