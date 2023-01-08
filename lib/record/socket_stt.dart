import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:icope/utils/environment.dart';

class Speech2Text {
  //若透過Android手機傳送，則設為"A"；若透過網頁傳送，則設為"W"
  final String label = "A";
  final serviceId = "0001";

  //由SERVER端提供之token
  final String token =Environment.stt_token;

  // Connect to socket
  // parameter: wav file path, call back function, and language
  Future connect(
      String path, void Function(String) handler, String language) async {
    String modelname = language + "\u0000\u0000";
    String outmsg = token + "@@@" + modelname + label + serviceId;
    //將outmsg轉成byte[]
    List<int> outmsgByte = utf8.encode(outmsg);
    //將語音檔案轉成byte[]，使用下方convert(String path) function
    List<int> waveByte = await convert(path);
    //將outmsg以及語音檔案兩個陣列串接，使用下方 byteconcate(byte[] a, byte[] b) function
    List<int> outbyte = byteconcate(outmsgByte, waveByte);

    //用於計算outmsg和語音檔案串接後的byte數
    var g = Uint32List(4);
    // little endian 轉 big endian
    g[0] = (outbyte.length & 0xff000000) >>> 24;
    g[1] = (outbyte.length & 0x00ff0000) >>> 16;
    g[2] = (outbyte.length & 0x0000ff00) >>> 8;
    g[3] = (outbyte.length & 0x000000ff);

    //連接socket
    await Socket.connect("140.116.245.149", 2804).then((socket) {
      print('---------Successfully connected------------');
      // 向socket傳送資料
      socket.add(byteconcate(g, outbyte));
      socket.flush();
      // socket監聽
      socket.listen((dataByte) {
        print('-------Data from socket-------');
        // decode byte to string
        var dataString = utf8.decode(dataByte);
        // 因為dart中Map中的引號是雙引號,但回傳的json格式是單引號，所以會報錯=>需要轉換
        Map response = jsonDecode(dataString.replaceAll("'", '"'));

        print(path);
        print(response);
        // 取得辨識結果中排名的第一名
        final taiTxt = response['rec_result'][0];
        // 顯示回傳結果
        print(taiTxt);
        // 呼叫 call back function
        handler(taiTxt);
      });
      // catch error
    }).catchError((e) {
      print("socket無法連接: $e");
    });
  }

  // 用於串接兩個byte[]
  // List<int> = java 中的 byte[]
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

  //用於將檔案轉換成byte，輸入為檔案路徑，輸出為byte[]
  Future<List<int>> convert(path) async {
    // create file
    var file = File(path);

    // 以byte方式讀取檔案
    var bytes = await file.readAsBytes();
    return bytes;
  }
}
