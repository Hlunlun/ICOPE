import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../record/flutter_tts.dart';
import '../record/nutri_player.dart';

//TODO : disabled -> once 3 months
final TextEditingController nutriController=TextEditingController();
final TextEditingController NOController=TextEditingController();
Color cursorColor = Color(0xFF50D781);
Color fillColor = Color(0xFFC2F6C5);
Color loginBtnColor = Color(0xff4ae86c);

Color cursorColor1 = Color(0xFF50D3D7);
Color fillColor1 = Color(0xFFC2F6EA);
Color loginBtn = Color(0xff4ae8c3);
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
        body:buildList()
    );

  }

  Widget buildList() {

    nutriRecordState.title = '三個月中體重是否無意減少?';
    return ListView(

      //Important :Remove any padding from the ListView
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(height: 50,),
        nutriRecord(),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
            child: Text('三個月中體重是否無意減少?',style: TextStyle(fontSize: 40),)
        ),

        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(loginBtnColor),
            ),
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('異常, 請前往鄰近醫院進行進一步檢查!!!'),
                  );
                },
              );
            },
            child: const Text('是',style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 25
            ),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(loginBtnColor),
            ),
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('無異常!繼續保持!!!'),
                  );
                },
              );
            },
            child: const Text('否',style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 25
            ),
            ),
          ),
        ),

        SizedBox(height: 50,),
        Center(
            child: Text('是否食慾不振?',style: TextStyle(fontSize: 40),)
        ),
        SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(loginBtn),
            ),
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('異常, 請前往鄰近醫院進行進一步檢查!!!'),
                  );
                },
              );
            },
            child: const Text('是',style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 25
            ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(loginBtn),
            ),
            onPressed: (){
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('無異常!繼續保持!!!'),
                  );
                },
              );
            },
            child: const Text('否',style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 25
            ),
            ),
          ),
        ),

      ],

    );
  }
}