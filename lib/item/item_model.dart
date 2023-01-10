import 'item.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';



class ItemModel{

  static bool cognitive= true;
  static int times= 0;
  static bool status= true;
  static bool nutrition= true;
  static bool vision= true;
  static bool listening= true;
  static bool mood = true;

  static List<Item> items = <Item>[
    Item(title: '認知功能', icon: Icons.missed_video_call, color: cognitiveColor ,route: '/cognitive'),
    Item(title: '行動能力', icon: Icons.run_circle_sharp, color:abilityColor, route: '/ability'),
    Item(title: '營養不良', icon: Icons.map, color: nutritionColor, route: '/nutrition'),
    Item(title: '視力', icon: Icons.remove_red_eye, color: visionColor, route: '/vision'),
    Item(title: '情緒', icon: Icons.mood, color: moodColor, route: '/mood'),
    Item(title: '聽力', icon: Icons.settings, color: listeningColor, route: '/listening'),
  ];
}