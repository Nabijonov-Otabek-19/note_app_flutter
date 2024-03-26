import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NoteFields {
  static const tableName = "my_note";

  static const id = "id";
  static const title = "title";
  static const description = "description";
  static const time = "time";

  static final List<String> values = [
    /// Add all fields
    id, title, description, time
  ];
}

final lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 16,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
  );
}
