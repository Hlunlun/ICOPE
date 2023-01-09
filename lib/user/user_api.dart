import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:icope/user/user.dart';
import 'package:icope/utils/environment.dart';


String api = '192.168.209.109:30011';


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

    static Future<bool> addNewUser(String name, String id, String pwd) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/add_new_user");
        final http.Response response = await client.post(
            uri,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
                'name' : name,
                'id': id,
                'pwd' : pwd,
            }),
        );
        if(response.statusCode==200){
            final json = jsonDecode(response.body);
            if(json['success']){
                return true;
            }else{
                return false;
            }
        }else {
            throw Exception('Failed to Save User.');
        }
    }

    static Future<Map> findUser(String id) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/find_user_info");
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
                return json['user'];
            }else{
                return {'wrong' : 'true'};
            }
        }else {
            throw Exception('Failed to Save User.');
        }
    }

    static Future<bool> updateUserBasicInfo(String id,int gender,int age) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/update_user_basic");
        final http.Response response = await client.post(
            uri,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
                'id': id,
                'gender':gender.toString(),
                'age' : age.toString(),
            }),
        );
        if(response.statusCode==200){
            final json = jsonDecode(response.body);
            if(json['success']){
                print(json);
                return true;
            }else{
                return false;
            }
        }else {
            throw Exception('Failed to Save User.');
        }
    }

    static Future<bool> updateDailyRecord(String id,String bloodPressure, String weight, String height) async{
        var client =http.Client();
        var uri=Uri.parse("http://" + api + "/update_daily_record");
        final http.Response response = await client.post(
            uri,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
                'id': id,
                'bloodPressure':bloodPressure,
                'weight' :  weight,
                'height' : height,
            }),
        );
        if(response.statusCode==200){
            final json = jsonDecode(response.body);
            if(json['success']){
                return true;
            }else{
                return false;
            }
        }else {
            throw Exception('Failed to Save User.');
        }
    }




}


