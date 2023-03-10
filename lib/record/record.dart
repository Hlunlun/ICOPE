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
        // ?????? Icon ???????????????
        minimumSize: const Size(10, 10),
        primary: primary,
        onPrimary: onPrimary,
      ),
      icon: Icon(icon),
      label: Text(
        text,
        // ????????????????????????????????????bold?????????normal????????????
        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
      ),
      // ??? Iicon ???????????????????????????
      onPressed: () async {
        // getTemporaryDirectory(): ????????????????????????????????????????????????????????????????????????????????????
        Directory tempDir = await path_provider.getTemporaryDirectory();
        // define file directory
        String path = '${tempDir.path}/SpeechRecognition.wav';
        // ?????????????????????????????????
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
        // TextField ??????????????????????????? Icon
        icon: const Icon(
            Icons.search, // Flutter ??????????????? icon
            color: Colors.grey, // ?????? icon ??????
        ),
        // ??? icon ???????????????????????????
        onPressed: () async {
            // ?????? TextField ???????????? value
            // ??????????????? return
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
        controller: recognitionController, // ?????? controller
        enabled: true, // ????????????????????????
        decoration: const InputDecoration(
          fillColor: Colors.white, // ???????????????????????????filled: true,?????????
          filled: true, // ????????????????????????true???fillColor?????????
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)), // ????????????????????????
            borderSide: BorderSide(
              color: Color.fromRGBO(220,127, 157, 1),// // ?????????????????????
              width: 2, // ?????????????????????
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
            // ??????????????? value
            value: 'Taiwanese',
            // Set option name???color
            title: const Text(
              'Taiwanese',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
            //  ??????Radio???value???groupValu??????????????? Radio ??????????????????????????????
            groupValue: recognitionLanguage,
            // ??????????????????
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                // ??? recognitionLanguage ?????? Taiwanese
                recognitionLanguage = "Taiwanese";
              });
            },
          ),
        RadioListTile<String>(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          // ??????????????? value
          value: 'Chinese',
          // Set option name???color
          title: const Text(
            'Chinese',
            style: TextStyle(color: Colors.black,fontSize: 10),
          ),
          //  ??????Radio???value???groupValu??????????????? Radio ??????????????????????????????
          groupValue: recognitionLanguage,
          // ??????????????????
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              // ??? recognitionLanguage ?????? Taiwanese
              recognitionLanguage = "Chinese";
            });
          },
      ),
    ]);
  }
}
