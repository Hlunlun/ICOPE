
import 'package:flutter/material.dart';
import 'package:icope/utils/constants.dart';
import 'package:icope/utils/drawer.dart';
import '../record/nutri_player.dart';


class Vision extends StatefulWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  State<Vision> createState() => _Vision();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Vision extends State<Vision> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
          title: const Text('視力評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),),
          backgroundColor: visionColor,
        ),
      body:buildList()
    );
  }

  Widget buildList() {

    nutriRecordState.title = '看遠近閱讀有無困難?';
    return ListView(

      //Important :Remove any padding from the ListView
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(height: 50,),
        Row(
          children: [
            nutriRecord(),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                child: Text('看遠近閱讀\n有無困難?',style: TextStyle(fontSize: 40),)
            ),
          ],
        ),
        SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(visionColor),
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
              backgroundColor: MaterialStateProperty.all(visionColor),
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