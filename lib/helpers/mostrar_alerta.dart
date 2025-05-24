import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(titulo),
            content: Text(subtitulo),
            actions: <Widget>[
              MaterialButton(
                child: Text('OK'),
                elevation: 6,
                textColor: Colors.amber.shade900,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }
  return showCupertinoDialog(
    context: context,
    builder:
        (_) => CupertinoAlertDialog(
          title: Text(titulo),
          content: Text(subtitulo),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
  );
}
