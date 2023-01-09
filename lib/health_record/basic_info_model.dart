import 'package:flutter/material.dart';
import 'package:icope/health_record/basic_info.dart';
import 'package:icope/main.dart';
import '../utils/constants.dart';

class BasicInfoModel{

  static List<BasicInfo> infos = <BasicInfo>[
      BasicInfo(leading: '性別 : ', title: MyApp.gender==0?'女':MyApp.gender==1?'男':'其他'),
      BasicInfo(leading: '體重 : ', title: MyApp.weight.toString()),
      BasicInfo(leading: '年齡 : ', title: MyApp.age.toString()),
      BasicInfo(leading: '身高 : ', title: MyApp.height.toString()),
  ];
}