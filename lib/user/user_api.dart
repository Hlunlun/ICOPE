import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:icope/user/user.dart';

String api = '10.6.250.91:30011';

class UserApi {

    static Future<bool> checkUser( String id,String pwd) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/check_user");
        final http.Response response = await client.post(
            uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'id': id,
              'pwd': pwd
            }),
        );
        if(response.statusCode==200){
            final json = jsonDecode(response.body);
            if(json['exist']){
              return true;
            }
            return false;
        }else {
            throw Exception('Failed to Save User.');
        }
    }

    static Future<String> findUserName( String id) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/find_user_name");
        final http.Response response = await client.post(
            uri,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'id': id,
            }),
        );
        if(response.statusCode==200){
            final json = jsonDecode(response.body);
            if(json['success']){
                return json['name'];
            }else{
                return "None";
            }
        }else {
            throw Exception('Failed to Save User.');
        }
    }
}


