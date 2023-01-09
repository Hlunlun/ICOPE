import 'package:flutter/material.dart';
import 'package:icope/health_record/basic_info.dart';
import 'package:icope/main.dart';
import '../utils/constants.dart';

class BasicInfoModel{

  static String gender= '';
  static String weight = '';
  static String age = '';
  static String height = '';

  static List<BasicInfo> infos = <BasicInfo>[
      BasicInfo(leading: '性別 : ', title: gender),
      BasicInfo(leading: '體重 : ', title: weight),
      BasicInfo(leading: '年齡 : ', title: age),
      BasicInfo(leading: '身高 : ', title: height),
  ];
}