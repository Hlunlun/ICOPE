import 'item.dart';
import 'package:flutter/material.dart';


class ItemModel{

  static List<Item> items = <Item>[
    Item(title: '認知功能', icon: Icons.smartphone_sharp, color: Color(0xFFDDB4D4) ,route: '/cognitive'),
    Item(title: '行動能力', icon: Icons.contacts, color: Color(0xFFFEE9F2), route: '/action'),//const Color.fromARGB(1, 208, 119, 119)
    Item(title: '營養不良', icon: Icons.map, color: Color(0xFFDEEC7A), route: '/nutrition'),//const Color.fromARGB(1, 145,  170, 125)
    Item(title: '視力', icon: Icons.phone, color: Color(0xFFC1DDDF), route: '/vision'),//const Color.fromARGB(1, 102, 137, 165)
    Item(title: '情緒', icon: Icons.mood, color: Color(0xFFFEF2AA), route: '/mood'),// const Color.fromARGB(1, 213, 168, 124)
    Item(title: '聽力', icon: Icons.settings, color: Color(0xFF79C5CF), route: '/listening'),
  ];
}