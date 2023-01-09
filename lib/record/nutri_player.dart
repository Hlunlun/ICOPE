import 'dart:io';
import 'socket_tts.dart';
import 'sound_player.dart';
import 'sound_recorder.dart';
import 'flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'socket_stt.dart';



class nutriRecord extends StatefulWidget {
  //const nutriRecord({Key? key}) : super(key: key);
  nutriRecord({
    Key? key,
  }) : super(key: key);

  @override
  State<nutriRecord> createState() => nutriRecordState();
}

class nutriRecordState extends State<nutriRecord>{
  static String title='';

  // get SoundRecorder
  final recorder = SoundRecorder();
  // get soundPlayer
  final player = SoundPlayer();

  static bool find = false;

  // Declare TextEditingController to get the value in TextField
  TextEditingController taiwanessController = TextEditingController();
  TextEditingController chineseController = TextEditingController();
  TextEditingController recognitionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    recorder.init();
    player.init();
  }

  @override
  void dispose() {
    recorder.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 10,),
          const SizedBox(width: 10,),
          buildSearchField(),
        ],
      ),
    ],

  );


  // set recognitionController.text function
  void setTxt(taiTxt) {
    setState(() async {
      recognitionController.text = taiTxt;
    });
  }

  Widget buildSearchField() {
    return IconButton(
      // TextField 中最後可以選擇放入 Icon
      icon: const Icon(
        Icons.volume_down, // Flutter 內建的搜尋 icon
        color: Colors.grey, // 設定 icon 顏色
        size: 50,
      ),
      // 當 icon 被點擊時執行的動作
      onPressed: () async {

        if (title.isEmpty) return;
        // connect to text2speech socket
        await Text2Speech().connect(play, title, recognitionLanguage.toLowerCase());

      },
    );
  }

  Future play(String pathToReadAudio) async {
    await player.play(pathToReadAudio);
    setState(() {
      player.init();
      player.isPlaying;
    });
  }


  Widget buildOutputField() {
    return SizedBox(
      width: 200,
      height: 50,
      child: TextField(
        controller: recognitionController, // 設定 controller
        enabled: true, // 設定不能接受輸入
        decoration: const InputDecoration(
          fillColor: Colors.white, // 背景顏色，必須結合filled: true,才有效
          filled: true, // 重點，必須設定為true，fillColor才有效
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)), // 設定邊框圓角弧度
            borderSide: BorderSide(
              color: Color.fromRGBO(220,127, 157, 1),// // 設定邊框的顏色
              width: 2, // 設定邊框的粗細
            ),
          ),
        ),
      ),
    );
  }

  // Use to choose language of speech recognition
  String recognitionLanguage = "Taiwanese";
}