
import 'package:flutter/material.dart';
import 'package:icope/item/item_model.dart';
import 'package:icope/user/user_api.dart';
import 'package:icope/utils/constants.dart';
import 'package:icope/utils/drawer.dart';
import '../record/record.dart';
import '../record/nutri_player.dart';

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
          backgroundColor: moodColor,
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
          Row(
            children: [
              nutriRecord(),
              Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                  child: Text('過去兩周是\n否感到厭煩\n或沒希望?', style: TextStyle(fontSize: 40),)
              ),
            ],
          ),
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(moodColor),
              ),
              onPressed: () {
                ItemModel.mood = false;
                UserApi.updateHealthRecord().then((value){
                    if(value){
                      showDialog<String>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                            Text('異常, 請前往鄰近醫院進行進一步檢查!!!',style:TextStyle(fontSize: 30,color: Colors.black54)),
                          );
                        },
                      );
                    }
                });

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
                backgroundColor: MaterialStateProperty.all(moodColor),
              ),
              onPressed: () {
                ItemModel.mood = true;
                UserApi.updateHealthRecord().then((value) {
                  if (value) {
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                          Text('無異常!繼續保持!!!',style:TextStyle(fontSize: 30,color: Colors.black54)),
                        );
                      },
                    );
                  }
                });

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