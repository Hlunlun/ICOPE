import 'item.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';



class ItemModel{

  static List<Item> items = <Item>[
    Item(title: '認知功能', icon: Icons.missed_video_call, color: cognitiveColor ,route: '/cognitive'),
    Item(title: '行動能力', icon: Icons.run_circle_sharp, color:abilityColor, route: '/ability'),//const Color.fromARGB(1, 208, 119, 119)
    Item(title: '營養不良', icon: Icons.map, color: nutritionColor, route: '/nutrition'),//const Color.fromARGB(1, 145,  170, 125)
    Item(title: '視力', icon: Icons.remove_red_eye, color: visionColor, route: '/vision'),//const Color.fromARGB(1, 102, 137, 165)
    Item(title: '情緒', icon: Icons.mood, color: moodColor, route: '/mood'),// const Color.fromARGB(1, 213, 168, 124)
    Item(title: '聽力', icon: Icons.settings, color: listeningColor, route: '/listening'),
  ];
}