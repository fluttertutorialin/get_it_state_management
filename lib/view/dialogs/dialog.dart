import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDialogError({String? title, required String? content}) => Get.dialog(
    AlertDialog(
        title: Text(title!),
        content: Text(content ?? ""),
        actions: <Widget>[
          TextButton(
              child: Text('Close'),
              onPressed: () {
                Get.back();
              })
        ]),
    barrierDismissible: false);

showDialogLoading() => Get.dialog(
    WillPopScope(
        onWillPop: () async => false,
        child: Center(
            child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(strokeWidth: 1.5)))),
    barrierDismissible: false);
