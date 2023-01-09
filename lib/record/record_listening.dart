import 'dart:io';
import 'socket_tts.dart';
import 'sound_player.dart';
import 'sound_recorder.dart';
import 'flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'socket_stt.dart';



class listenRecord extends StatefulWidget {
  const listenRecord({Key? key}) : super(key: key);
  @override
  State<listenRecord> createState() => listenRecordState();
}

class listenRecordState extends State<listenRecord> {
  // get SoundRecorder
  static String recordOutput = '';
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
          buildRecord(),
          const SizedBox(width: 10,),
          buildOutputField(),
        ],
      ),
    ],

  );


  // build the button of recorder
  Widget buildRecord() {
    // whether is recording

    final isRecording = recorder.isRecording;
    // if recording => icon is Icons.stop
    // else => icon is Icons.mic
    final icon = isRecording ? Icons.stop : Icons.mic;
    // if recording => color of button is red
    // else => color of button is white
    final primary = isRecording ? Colors.red : Color.fromRGBO(230,150, 157, 1);
    // if recording => text in button is STOP
    // else => text in button is START
    final text = isRecording ? 'STOP' : 'START';
    // if recording => text in button is white
    // else => color of button is black
    final onPrimary = isRecording ? Colors.white : Colors.black;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        // 設定 Icon 大小及屬性
        minimumSize: const Size(10, 10),
        primary: primary,
        onPrimary: onPrimary,
      ),
      icon: Icon(icon),
      label: Text(
        text,
        // 設定字體大小及字體粗細（bold粗體，normal正常體）
        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
      ),
      // 當 Iicon 被點擊時執行的動作
      onPressed: () async {
        // getTemporaryDirectory(): 取得暫存資料夾，這個資料夾隨時可能被系統或使用者操作清除
        Directory tempDir = await path_provider.getTemporaryDirectory();
        // define file directory
        String path = '${tempDir.path}/SpeechRecognition.wav';
        // 控制開始錄音或停止錄音
        await recorder.toggleRecording(path);
        // When stop recording, pass wave file to socket
        if (!recorder.isRecording)await Speech2Text().connect(path, setTxt, "MTK_ch");
        // set state is recording or stop
        setState(() {
          recorder.isRecording;
        });
      },
    );
  }

  // set recognitionController.text function
  void setTxt(taiTxt) {
    setState(() async {
      recognitionController.text = taiTxt;
      // recordOutput = recognitionController.text;
    });
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
