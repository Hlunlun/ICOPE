import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../gender/gender_model.dart';

class HealthRecordCard extends StatelessWidget{


    const HealthRecordCard({
        Key?key,
        required this.title,
        required this.icon,
        required this.value,
    }):super(key: key);

    final String title;
    final IconData icon;
    final int value;

    @override
    Widget build(BuildContext context) {
      return InkWell(
          onTap: () {

          },
          child: Card(
              child: Container(
                color: Colors.white,
                  height: 200,
                  // width: 350,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Row(
                            children: [
                              Expanded(child:
                              Text(title,style: TextStyle(fontSize: 26),)),
                              Icon(icon,color: Colors.red,)
                            ],
                          )



                      ]
                  )
              )
          ),
      );
  }
}