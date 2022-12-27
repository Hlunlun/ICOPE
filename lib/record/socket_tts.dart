import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:icope/environment.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:flutter_dotenv/flutter_dotenv.dart';


class Text2Speech {

  // initialize data
  List<int> data = [];
  // socket state
  bool socketStatus = false;
  // service token

  final String token = Environment.tts_token;
  // Connect to socket
  // parameter: call back function, speech synthesized text, speech language
  // default model is man
  Future connect(void Function(String) player, String strings, String language ) async {
    String model = "";
    int port = 10012;
    if (language=="taiwanese"){
      model = "M12_sandhi";
      language = "taiwanese_sandhi";
      port = 10012;
    }
    else if (language=="chinese"){
      model = "M60";
      port = 10015;
    }


    String outmsg = token + "@@@" + strings + "@@@" + model +"@@@"+ language;

    //將outmsg轉成byte[]
    List<int> outbyte = utf8.encode(outmsg);

    //用於計算outmsg和語音檔案串接後的byte數
    var g = Uint32List(4);
    // little endian 轉 big endian
    g[0] = ((outbyte.length & 0xff000000) >>> 24);
    g[1] = ((outbyte.length & 0x00ff0000) >>> 16);
    g[2] = ((outbyte.length & 0x0000ff00) >>> 8);
    g[3] = ((outbyte.length & 0x000000ff));


    await Socket.connect("140.116.245.157", port).then((socket) async {
      print('------Successfully connected------');
      // 向socket傳送資料
      socket.add(byteconcate(g, outbyte));
      socket.flush();
      // socket監聽
      socket.listen((dataByte) async {
        print('------Data from socket------');
        // Get dataByte from socket
        // 用於串接兩個byte[]
        data = byteconcate(data, dataByte);
        // print(data);
      }, onDone: () async {
        print("------Data form socket is done------");
        socket.destroy();
        // getTemporaryDirectory(): 取得暫存資料夾，這個資料夾隨時可能被系統或使用者操作清除
        Directory tempDir = await path_provider.getTemporaryDirectory();
        // define file path
        String pathToReadAudio = '${tempDir.path}/SpeechSynthesis.wav';
        // create file
        var file = File(pathToReadAudio);
        // write the data to file in byte
        await file.writeAsBytes(data, flush: true);
        // call back function
        player(pathToReadAudio);
      });
      // catch error
    }).catchError((e) {
      print("socket無法連接: $e");
    });

    //連接socket
    // await Socket.connect("140.116.245.157", port).then((socket) async {
    //   print('---------Successfully connected------------');
    //   // 向socket傳送資料
    //   socket.add(byteconcate(g, outbyte));
    //   socket.flush();
    //
    //   // socket監聽
    //   socket.listen((dataByte) async {
    //     print('-------Data from socket-------');
    //     // get data from socket
    //     var data = dataByte;
    //     // close socket
    //     await socket.close();
    //     socket.destroy();
    //     // getTemporaryDirectory(): 取得暫存資料夾，這個資料夾隨時可能被系統或使用者操作清除
    //     Directory tempDir = await path_provider.getTemporaryDirectory();
    //     // define file path
    //     String pathToReadAudio = '${tempDir.path}/SpeechSynthesis.wav';
    //     print(data);
    //     // create file
    //     var file = File(pathToReadAudio);
    //     // write the data to file in byte
    //     await file.writeAsBytes(data, flush: true);
    //     // call back function
    //     player(pathToReadAudio);
    //   });
    //   // catch error
    // }).catchError((e) {
    //   print("socket無法連接: $e");
    // });

  }

  //用於串接兩個byte[]
  List<int> byteconcate(List<int> a, List<int> b) {
    // 宣告 result 為 size 是 (a.length + b.length) 的 sign 32bits 的 byte[]
    List<int> result = Int32List(a.length + b.length);

    /// Java的System.arrayCopy(source, sourceOffset, target, targetOffset, length)
    /// = target.setRange(targetOffset, targetOffset + length, source, sourceOffset);
    result.setRange(
        0, a.length, a, 0); // =System.arraycopy(a, 0, result, 0, a.length);
    result.setRange(a.length, a.length + b.length, b,
        0); // =System.arraycopy(b, 0, result, a.length, b.length);

    return result;
  }
}
