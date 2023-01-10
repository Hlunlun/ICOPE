import 'package:icope/item/item_model.dart';
import 'package:icope/user/user_api.dart';

import '../utils/constants.dart';
import 'package:flutter/material.dart';
import '../record/record_listening.dart';
import '../record/nutri_player.dart';
import 'package:icope/utils/drawer.dart';

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
            fontWeight: FontWeight.w900
          ),),
          backgroundColor: listeningColor,
        ),
        body:buildlist(),
    );

  }

  Widget buildlist(){
    nutriRecordState.title = '三六九';

    return ListView(

      //Important :Remove any padding from the ListView
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(height: 50,),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text('請按播放鍵\n聆聽數字',style: TextStyle(fontSize: 40),),
            ),
            nutriRecord(),
          ],
        ),


        SizedBox(height: 50,),

        listenRecord(),


        SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(listeningColor),
            ),
            onPressed: () {
              final contains361 = listenRecordState.recordOutput.contains('3');
              if(contains361) {
                ItemModel.listening = true;
                UserApi.updateHealthRecord().then((value){
                  if(value){
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                          Text('答對了! 聽力正常, 請繼續保持',style:TextStyle(fontSize: 30,color: Colors.black54)),
                        );
                      },
                    );
                  }
                });

              }
              else{
                ItemModel.listening = false;

                UserApi.updateHealthRecord().then((value){
                  if(value){
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                          Text('答錯了, 異常, 請前往鄰近醫院進行進一步檢查!!!',style:TextStyle(fontSize: 30,color: Colors.black54)),
                        );
                      },
                    );
                  }
                });

              }
            },
            child: const Text('送出語音', style: TextStyle(
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