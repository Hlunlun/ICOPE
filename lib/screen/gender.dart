import 'package:icope/gender/gender_model.dart';
import 'package:icope/gender/gender_card.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';



final TextEditingController timesController=TextEditingController();
class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _Gender();
}


class _Gender extends State<Gender> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child:  Text('請點選你的性別', style: TextStyle(
                  fontSize: 40, color: loginBtnColor,fontWeight: FontWeight.w900
              ),),
            ),
            GenderCard(),
            SizedBox(height: 25,),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                    backgroundColor: MaterialStateProperty.all(loginBtnColor),
                ),
                onPressed: (){
                    Navigator.pushNamed(context, '/age');
                },
                child:const Text('確認',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 25
                ),),
            )

          ],

        ),
    );
  }


}