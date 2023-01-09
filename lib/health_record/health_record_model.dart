import 'package:flutter/material.dart';
import 'package:icope/health_record/health_record_class.dart';
import 'package:icope/main.dart';
import '../utils/constants.dart';

class HealthRecordModel{

    static List<HealthRecordClass> items = <HealthRecordClass>[
      HealthRecordClass(title: '血壓', icon: Icons.favorite, value: MyApp.bloodPressure),
      HealthRecordClass(title: '體重', icon: Icons.favorite, value: MyApp.weight),
      HealthRecordClass(title: '身高', icon: Icons.favorite, value: MyApp.height),

    ];

    // static Future<List<Restaurant>> getRestaurants(String? selectedCategory)async{
    //
    //   http.Response res = await http.get(
    //     Uri.parse('http://140.116.107.43:30011/get_data?genre=$selectedCategory'),
    //   );
    //
    //   if(res.statusCode == 200){
    //     final json = jsonDecode(res.body);
    //     final results = json['results']['data'];
    //     final restaurants = results.map<Restaurant>((result)=>Restaurant.fromJson(result as Map<String, dynamic>)).toList();
    //
    //     return restaurants;
    //   }else{
    //     throw Exception('Failed to load restaurant:${res.body}');
    //   }
    // }
}