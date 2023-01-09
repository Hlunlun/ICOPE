
import 'package:flutter/material.dart';
import '../record/record.dart';
import '../record/nutri_player.dart';
Color loginBtnColor = Color(0xffe0a051);
class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  State<Mood> createState() => _Mood();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Mood extends State<Mood> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer('userEmail', context),
        appBar: AppBar(

          title: const Text('情緒評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.orangeAccent,
        ),
        body:ListView(

          //Important :Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 50,),
            nutriRecord(title: '過去兩周是否感到厭煩或沒有希望?'),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
                child: Text('過去兩周是否感到厭煩或沒有希望?',style: TextStyle(fontSize: 40),)
            ),
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                  backgroundColor: MaterialStateProperty.all(loginBtnColor),
                ),
                onPressed: (){
                  showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content:
                        Text('異常, 請前往鄰近醫院進行進一步檢查!!!'),
                      );
                    },
                  );
                },
                child: const Text('是',style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 25
                ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(150,65.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                  backgroundColor: MaterialStateProperty.all(loginBtnColor),
                ),
                onPressed: (){
                  showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content:
                        Text('無異常!繼續保持!!!'),
                      );
                    },
                  );
                },
                child: const Text('否',style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 25
                ),
                ),
              ),
            ),
          ],
        )
    );

  }

  Widget buildDrawer(String userEmail, BuildContext context) {
    return Drawer(

      //Add  a ListView to the drawer.This ensures the user can scroll
      //through the options in the drawer if there isn't enough vertical
      //space to fit everything
      child: Container(
        color: const Color(0xFFC4C4C4),
        child: ListView(

          //Important :Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('username', style: stringStyle,),
              accountEmail: Text(userEmail, style: stringStyle,),
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent
              ),

              currentAccountPicture: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 100.0,
                height: 30.0,
                decoration: const BoxDecoration(
                  //shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   fit: BoxFit.fitWidth,
                  //   image: AssetImage('assets/images/lun.jpg'),
                  //
                  // ),
                ),
              ),
            ),

            ListTile(
              title: const Text('Health Record', style: stringStyle,),
              leading: const Icon(Icons.folder),
              onTap: () {
                //Update the state of the app
                //..
                //Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(

              title: const Text('Logout', style: stringStyle,),
              leading: const Icon(Icons.upload_rounded),
              onTap: () {
                //Update the state of the app
                //..
                //Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Setting', style: stringStyle,),
              leading: const Icon(Icons.settings),
              onTap: () {
                //Update the state of the app
                //...
                //Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),

    );
  }
}