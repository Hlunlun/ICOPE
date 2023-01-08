import 'package:flutter/material.dart';


class ShowAlertDialog extends StatelessWidget {
  ShowAlertDialog({
    required this.message,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String message;
  final String title;

  Color okBtnColor = Color(0xffe8ad4a);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message,style: TextStyle(fontSize: 20),),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(okBtnColor),
          ),
          onPressed: () => Navigator.pop(context, 'ok'),
          child: const Text('好的',style: TextStyle(fontSize: 30,color: Colors.white),),
        ),
      ],
    );
  }
}