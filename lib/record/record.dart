import 'dart:io';
import 'socket_tts.dart';
import 'sound_player.dart';
import 'sound_recorder.dart';
import 'flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'socket_stt.dart';



// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Speech',
//       theme: ThemeData(
//         backgroundColor: Colors.black,
//       ),
//       home: const MainPage(title: 'Speech'),
//     );
//   }
// }

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);


  @override
  State<Record> createState() => RecordState();
}

class RecordState extends State<Record> {
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
              buildRecord(),
              const SizedBox(width: 10,),
              buildOutputField(),
              buildSearchField(),
            ],
          ),
          buildRadio(),
          // FutureBuilder(
          //   future: RestaurantModel.getRestaurant(recognitionController.text),
          //   builder: (context, snapshot){
          //     if(snapshot.hasData){
          //       final restaurant = snapshot.data as Restaurant;
          //       return RestaurantCard(
          //           image: Image.network(restaurant.imagePath),
          //           title: restaurant.title,
          //           details: restaurant.details
          //       );
          //     }else if(snapshot.hasError){
          //       return Text('${snapshot.error}');
          //     }else{
          //       return const CircularProgressIndicator();
          //     }
          //   },
          // ),
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
        if (!recorder.isRecording) {
          if (recognitionLanguage == "Taiwanese") {
            // if recognitionLanguage == "Taiwanese" => use Minnan model
            // setTxt is call back function
            // parameter: wav file path, call back function, model
            await Speech2Text().connect(path, setTxt, "Minnan");
            // glSocket.listen(dataHandler, cancelOnError: false);
          } else {
            // if recognitionLanguage == "Chinese" => use MTK_ch model
            await Speech2Text().connect(path, setTxt, "MTK_ch");

          }
        }
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
    });
  }

  Widget buildSearchField() {
    return IconButton(
        // TextField 中最後可以選擇放入 Icon
        icon: const Icon(
            Icons.search, // Flutter 內建的搜尋 icon
            color: Colors.grey, // 設定 icon 顏色
        ),
        // 當 icon 被點擊時執行的動作
        onPressed: () async {
            // 得到 TextField 中輸入的 value
            // 如果為空則 return
            String strings = recognitionController.text ;
            if (strings.isEmpty) return;
            // connect to text2speech socket
            await Text2Speech().connect(play, strings, recognitionLanguage.toLowerCase());

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

  Widget buildRadio() {
    return Column(
        children:[
        RadioListTile<String>(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
            // 設定此選項 value
            value: 'Taiwanese',
            // Set option name、color
            title: const Text(
              'Taiwanese',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
            //  如果Radio的value和groupValu一樣就是此 Radio 選中其他設置為不選中
            groupValue: recognitionLanguage,
            // 設定選種顏色
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                // 將 recognitionLanguage 設為 Taiwanese
                recognitionLanguage = "Taiwanese";
              });
            },
          ),
        RadioListTile<String>(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          // 設定此選項 value
          value: 'Chinese',
          // Set option name、color
          title: const Text(
            'Chinese',
            style: TextStyle(color: Colors.black,fontSize: 10),
          ),
          //  如果Radio的value和groupValu一樣就是此 Radio 選中其他設置為不選中
          groupValue: recognitionLanguage,
          // 設定選種顏色
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              // 將 recognitionLanguage 設為 Taiwanese
              recognitionLanguage = "Chinese";
            });
          },
      ),
    ]);
  }
}
