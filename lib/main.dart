import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:icope/screen/age.dart';
import 'package:icope/screen/ask_question.dart';
import 'package:icope/screen/gender.dart';
import 'package:icope/screen/health_record.dart';
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
  static int gender = 0;
  static int age = 0;
  static int weight = 0;
  static int height = 0;
  static List<String> health_record = [];

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
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        // Locale('en', ''),
        Locale('zh', ''),
        // Locale('he', ''),
        // Locale('es', ''),
        // Locale('ru', ''),
      ],
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
        '/ability' : (context) => const Ability(),
        '/listening' : (context) => const Listening(),
        '/ask_question' : (context) => const AskQuestion(),
        '/health_record' : (content) => const HealthRecord(),
        '/gender' : (context) => const Gender(),
        '/age' : (context) => const Age(),
      },
    );
  }
}