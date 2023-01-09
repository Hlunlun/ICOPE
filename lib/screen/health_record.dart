import 'package:icope/gender/gender_model.dart';
import 'package:icope/health_record/basic_info_card.dart';
import 'package:icope/main.dart';

import '../utils/constants.dart';
import 'package:flutter/material.dart';

final TextEditingController timesController=TextEditingController();
class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  State<HealthRecord> createState() => _HealthRecord();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);



class _HealthRecord extends State<HealthRecord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.person,size: 50,color: Color(0xff4e4a4b),),
                SizedBox(width: 10,),
                Text(MyApp.username,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Color(0xff4e4a4b),),)
              ],
            ),
            Divider(
                indent : 10,
                endIndent : 10,
            ),
            SizedBox(width: 10,),
            Center(
              child: BasicInfoCard(),
            )


          ]
        ),
    );
  }


}