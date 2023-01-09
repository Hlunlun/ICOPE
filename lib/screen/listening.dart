
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../record/record.dart';


class Listening extends StatefulWidget {
  const Listening({Key? key}) : super(key: key);

  @override
  State<Listening> createState() => _Listening();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Listening extends State<Listening> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('聽力評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.yellowAccent,
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
        body:Record()
    );

  }


}