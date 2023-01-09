
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../record/record.dart';
import '../record/nutri_player.dart';
Color loginBtnColor = Color(0xffe0a051);
class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _Mood();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Mood extends State<Mood> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('情緒評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.orangeAccent,
        ),
        body:buildlist(),
    );

  }




  Widget buildlist() {

    nutriRecordState.title = '過去兩周是否感到厭煩或沒有希望?';

    return ListView(

        //Important :Remove any padding from the ListView
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 50,),
          nutriRecord(),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
              child: Text('過去兩周是否感到厭煩或沒有希望?', style: TextStyle(fontSize: 40),)
          ),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(loginBtnColor),
              ),
              onPressed: () {
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
              child: const Text('是', style: TextStyle(
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
                fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(loginBtnColor),
              ),
              onPressed: () {
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
              child: const Text('否', style: TextStyle(
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