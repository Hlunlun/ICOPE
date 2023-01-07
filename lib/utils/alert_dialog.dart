import 'package:flutter/material.dart';


class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('請完整填寫資料'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'ok'),
          child: const Text('好的'),
        ),
      ],
    );
  }
}