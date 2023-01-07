
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../record/record.dart';
import '../timer_model.dart';
import 'dart:async';

class Ability extends StatefulWidget {
  const Ability({Key? key}) : super(key: key);

  @override
  State<Ability> createState() => _Ability();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);



class _Ability extends State<Ability> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('行動能力評估', style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.redAccent,
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
        body: Column(

          children: [

            SizedBox(height: 50,),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                child: Text(
                  '請在12秒內雙手抱胸起立坐下15次', style: TextStyle(fontSize: 40),)
            ),
            TimerModel(),
            Record(),
          ],
        )
    );
  }
}