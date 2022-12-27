import 'package:flutter_tts/flutter_tts.dart';

class Text2SpeechFlutter {
  final FlutterTts flutterTts = FlutterTts();

  Future speak(String strings) async {
    // print all language
    // print(await flutterTts.getLanguages);
    // set language
    await flutterTts.setLanguage("zh-TW");
    // set pitch
    // await flutterTts.setPitch();
    await flutterTts.speak(strings);
  }
}
