import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../gender/gender_model.dart';

class HealthRecordCard extends StatefulWidget {
  @override
  _HealthRecordCardState createState() => _HealthRecordCardState();
}

class _HealthRecordCardState extends State<HealthRecordCard> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(0, GenderModel.genders[0],),
        buildCard(1, GenderModel.genders[1],),
        buildCard(2, GenderModel.genders[2],),
      ],
    );
  }

  Widget buildCard(int index, IconData icon) {

    return  InkWell(
      onTap: () => setState(
            () {
          _selected = index;
        },
      ),
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: loginBtnColor,
                width: 6
            ),
          ),
          color: _selected == index ? loginBtnColor : Colors.white,
          child: Container(
              height: 140,
              width: 350,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size:140,
                      color: _selected == index ? Colors.white : loginBtnColor,
                    ),
                  ]
              )
          )
      ),
    );
  }
}