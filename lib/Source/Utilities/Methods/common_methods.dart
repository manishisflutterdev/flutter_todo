import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonMethods {
  static toast(String message, {bool error = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: error ? Colors.red : Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
