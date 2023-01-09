
import 'package:flutter/material.dart';

class User {

    String name;
    String id;
    String  pwd = "";
    int weight = 0;
    int height = 0;
    int blood_pressure = 0;

    User({
      required this.name,
      required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        //TODO

    );


}