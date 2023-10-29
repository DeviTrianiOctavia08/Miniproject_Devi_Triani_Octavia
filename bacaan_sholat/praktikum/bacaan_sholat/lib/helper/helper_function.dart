import 'dart:async';

import 'package:flutter/material.dart';

class HelperFunction {
  static Future<bool> showErrorDialog(
      BuildContext context, String title, String message) async {
    Completer<bool> completer = Completer<bool>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true); // Mengembalikan nilai true saat tombol "OK" ditekan
              },
            ),
          ],
        );
      },
    ).then((value) {
      completer.complete(value ?? false);
    });

    return completer.future;
  }
}
