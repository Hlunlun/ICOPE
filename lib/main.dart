import 'package:flutter/material.dart';
import 'package:icope/screen/signup.dart';

import 'screen/home_page.dart';
import 'screen/ability.dart';
import 'screen/vision.dart';
import 'screen/dailyrecord.dart';
import 'screen/mood.dart';
import 'screen/nutrition.dart';
import 'screen/signin.dart';
import 'screen/cognitive.dart';
import 'screen/listening.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String username = "";
  static String userid = "";

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.light().copyWith(primary: Colors.orange),
       useMaterial3: true
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context)=>const Signin(),
        '/signup' : (context) =>const Signup(),
        '/main': (context)=>const HomePage(),
        '/cognitive' :(context)=>const Cognitive(),
        '/dailyrecord' : (context)=>const DailyRecord(),
        '/mood' : (context) => const Mood(),
        '/nutrition' : (context) => const Nutrition(),
        '/vision' : (context) => const Vision(),
        '/action' : (context) => const Ability(),
        '/listening' : (context) => const Listening(),
      },
    );
  }
}