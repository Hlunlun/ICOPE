import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:icope/main.dart';
import 'package:icope/mychart/mychart_data.dart';

class MyChartModel {

  static List<MyChartData> datas=<MyChartData>[];

  static int len = MyApp.health_record.length;
  static var health_record = MyApp.health_record;

  static List<MyChartData> getWeight(){
    for(int i=0;i<len;i++){
        datas.add(MyChartData(date: health_record[i]['date'], value: health_record[i]['weight']));

    }
    return datas;
  }







}


