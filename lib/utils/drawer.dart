import 'package:flutter/material.dart';
import 'package:icope/main.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 250,
        child: Container(
          color: const Color(0xFFC4C4C4),
          child: ListView(

            //Important :Remove any padding from the ListView
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container (
                height: 150,
                decoration: BoxDecoration (
                    color: Color(0xff92C7C7)
                ),
                child: ListTile (
                    title: Text(MyApp.username, style: stringStyle,),
                    onTap: () {
                    },
                ),
              ),
              ListTile (
                leading: Icon(Icons.folder,size: 35),
                title: Text('健康紀錄', style: stringStyle,),
                onTap: () {
                },
              ),
              ListTile (
                leading: Icon(Icons.logout,size: 35,),
                title: Text('登出', style: stringStyle,),
                onTap: () {
                },
              ),
              ListTile (
                leading: Icon(Icons.phone_callback,size: 35,),
                title: Text('客服電話', style: stringStyle,),
                onTap: () {
                },
              ),


            ],
          ),
        ),
    );
  }
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 30,
    fontWeight: FontWeight.bold
);