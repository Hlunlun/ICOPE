import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icope/utils/constants.dart';

class TimerModel extends StatefulWidget {
  @override
  _TimerModel createState() => _TimerModel();
}

class _TimerModel extends State<TimerModel> {
  int time01 = 12;
  int time02 = 60;
  bool time01_start = false;

  var period = const Duration(seconds: 1);

  void time_button_event(){
    if (time01_start){
      time01_start = false;
    }
    else{
      time01_start = true;
    }

    Timer.periodic(period, (timer) {
      if (time01 < 1 || time01_start == false) {
        timer.cancel();
        // timer = null;
      }
      else{
        time01--;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$time01 秒', style: TextStyle(fontSize: 40)),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(abilityColor),
                      ),
                      onPressed: () => time_button_event(),
                      child: Text(time01_start?'停止計時':'開始計時',style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ],
            )
        );
  }
}