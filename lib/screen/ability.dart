import 'package:icope/item/item_model.dart';
import 'package:icope/user/user_api.dart';
import 'package:icope/utils/drawer.dart';

import '../utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/timer_model.dart';
import 'package:flutter/services.dart';
import '../record/nutri_player.dart';

final TextEditingController timesController=TextEditingController();
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
          title: const Text('行動能力評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: abilityColor,
        ),
        body:buildList()
    );
  }

  Widget buildList() {
    nutriRecordState.title = '請在12秒內雙手抱胸起立坐下15次';

    return ListView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      children: [
        SizedBox(height: 50,),
        Row(
          children: [
            nutriRecord(),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text('請在12秒內\n雙手抱胸起\n立坐下15次',style: TextStyle(fontSize: 40),)
            ),
          ],
        ),

        TimerModel(),

        Padding(
          padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
          child: TextFormField(
            controller: timesController,
            onChanged: (String text){
              if(text==""){

              }
            },
            style: TextStyle(
                fontSize: 30,
                height: 30/30
            ),
            cursorColor: cursorColor,
            cursorWidth: 3,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            textInputAction: TextInputAction.next,
            onSaved: (email) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0x66EF4021),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Colors.transparent), ),
              hintText:"輸入完成幾次",
              hintStyle: TextStyle(fontSize: 20,),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(Icons.add_box_rounded ,color: Colors.white,size: 40,),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
              backgroundColor: MaterialStateProperty.all(abilityColor),
            ),
            onPressed: (){
              ItemModel.times = int.parse(timesController.text);
              if(int.parse(timesController.text) >= 15){

                ItemModel.status = true;
                UserApi.updateHealthRecord();
                showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('很棒!繼續保持' ,style:TextStyle(fontSize: 30,color: Colors.black54)),
                    );
                  },
                );
              }
              else{
                ItemModel.status = false;
                UserApi.updateHealthRecord();
                showDialog<String>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                      Text('行動能力異常:\n世界衛生組織關於身體活動的全球建議\n1. 每周運動至少10分鐘\n2. 每周進行兩天或更多的肌力運動\n3. 若不能按照建議運動,那就盡可能地多運動',style:TextStyle(fontSize: 30,color: Colors.black54)),
                    );
                  },
                );
              }
            },
            child: const Text('送出',style: TextStyle(
                fontWeight: FontWeight.w300,
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