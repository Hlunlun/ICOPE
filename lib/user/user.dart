
import 'package:flutter/material.dart';

class User {

    final String name;
    final int id;
    var  pwd;
    var weight;
    var height;
    var blood_pressure;

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