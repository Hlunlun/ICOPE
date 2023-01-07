import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../record/record.dart';

//TODO : disabled -> once 3 months

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  State<Nutrition> createState() => _Nutrition();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Nutrition extends State<Nutrition> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('營養評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.lightGreenAccent,
          // actions: [
          //   IconButton(
          //     iconSize: 35,
          //     color: Colors.white,
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/favorite');
          //     },
          //     icon: const Icon(Icons.settings),
          //   ),
          // ],
        ),
        body:Column(
          children: [
            Record(),
            SizedBox(height: 50,),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
              child: Text('三個月中體重是否無意減少?',style: TextStyle(fontSize: 40),)
            )
          ],
        )
    );

  }


}