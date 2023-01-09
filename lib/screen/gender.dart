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
        backgroundColor: fillColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child:            Text('請點選你的性別', style: TextStyle(
                  fontSize: 30, color: loginBtnColor,fontWeight: FontWeight.w900
              ),),
            ),
            Flexible(
                child:ListView.builder(
                  itemCount: GenderModel.genders.length,
                  itemBuilder: (context, index) {
                    return GenderCard(
                      icon: GenderModel.genders[index],
                    );
                  },
                ),
            )
          ],

        ),
    );
  }


}