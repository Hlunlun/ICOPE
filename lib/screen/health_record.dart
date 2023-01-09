import '../utils/constants.dart';
import 'package:flutter/material.dart';

final TextEditingController timesController=TextEditingController();
class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  State<HealthRecord> createState() => _HealthRecord();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);



class _HealthRecord extends State<HealthRecord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fillColor,
        body: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(loginBtnColor),
            ),
            onPressed: () async{
              Navigator.pushNamed(context, '/gender');
            },
            child: const Text('請回答以下問題',style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 25
            ),),
          ),
        )
    );
  }


}