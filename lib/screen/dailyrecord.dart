
import 'package:flutter/material.dart';
import 'package:icope/health_record/basic_info_model.dart';
import 'package:icope/main.dart';
import 'package:icope/user/user_api.dart';
import 'package:icope/utils/drawer.dart';

class DailyRecord extends StatefulWidget {
  const DailyRecord({Key? key}) : super(key: key);

  @override
  State<DailyRecord> createState() => _DailyRecord();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _DailyRecord extends State<DailyRecord> {
  final TextEditingController bloodPressureController=TextEditingController();
  final TextEditingController weightController=TextEditingController();
  final TextEditingController heightController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('每日紀錄',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.grey,
        ),
        body: buildDailyForm(),
    );

  }

  @override
  Widget buildDailyForm(){

    return ListView(

      //Important :Remove any padding from the ListView
      padding: EdgeInsets.zero,
      children: <Widget>[

        SizedBox(height: 100,),

        ListTile(  /// 記得查ListTile
          leading: Text('血壓'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: bloodPressureController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        ListTile(  /// 記得查ListTile
          leading: Text('體重'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: weightController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        ListTile(  /// 記得查ListTile
          leading: Text('身高'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: heightController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        SizedBox(height: 50,),
        Padding(
            padding: const EdgeInsets.fromLTRB(60,0,60,0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(0,30.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(Colors.black54),
              ),
              onPressed: (){
                UserApi.updateDailyRecord(MyApp.userid, bloodPressureController.text, weightController.text, heightController.text).then((value){

                  MyApp.height = int.parse(heightController.text);
                  MyApp.weight = int.parse(weightController.text);

                  BasicInfoModel.gender = MyApp.gender==0?'女':MyApp.gender==1?'男':'其他';
                  BasicInfoModel.height = MyApp.height.toString();
                  BasicInfoModel.weight = MyApp.weight.toString();
                  BasicInfoModel.age = MyApp.age.toString();

                  bloodPressureController.text="";
                  weightController.text = "";
                  heightController.text = "";
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushNamed(context, '/main');
                });

              },
              child: const Text('提交',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 20
              ),),
            )),
      ],
    );
  }


}