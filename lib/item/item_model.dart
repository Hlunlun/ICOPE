import 'item.dart';
import 'package:flutter/material.dart';


class ItemModel{

  static List<Item> items = <Item>[
    Item(title: '認知功能', icon: Icons.smartphone_sharp, color: Colors.deepPurpleAccent, route: '/cognitive'),
    Item(title: '行動能力', icon: Icons.contacts, color: Colors.redAccent, route: '/action'),//const Color.fromARGB(1, 208, 119, 119)
    Item(title: '營養不良', icon: Icons.map, color: Colors.lightGreenAccent, route: '/nutrition'),//const Color.fromARGB(1, 145,  170, 125)
    Item(title: '視力', icon: Icons.phone, color:Colors.lightBlueAccent, route: '/vision'),//const Color.fromARGB(1, 102, 137, 165)
    Item(title: '情緒', icon: Icons.mood, color:Colors.orangeAccent, route: '/mood'),// const Color.fromARGB(1, 213, 168, 124)
    Item(title: '聽力', icon: Icons.settings, color: Colors.yellowAccent, route: '/listening'),
  ];

}