import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(context: context, barrierDismissible: false,
    builder: (context) => new Dialog(
      child: Container(
        color: Colors.white,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text(msg, style: TextStyle(fontSize: 15),)
          ],
        ),
      ),
    ));
  }
  
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}