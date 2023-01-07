import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {

  const ShowAlertDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text(message),
      actions: [
        ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ],
    );

  }

}