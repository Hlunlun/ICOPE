
import 'package:flutter/material.dart';
import '../record/record.dart';

class Cognitive extends StatefulWidget {
  const Cognitive({Key? key}) : super(key: key);

  @override
  State<Cognitive> createState() => _Cognitive();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Cognitive extends State<Cognitive> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer('userEmail', context),
        appBar: AppBar(

          title: const Text('認知能力評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.deepPurpleAccent,
          // actions: [
          //   IconButton(
          //     iconSize: 35,
          //     color: Colors.white,
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/favorite');
          //     },
          //     icon: const Icon(Icons.settings),
          //   ),
          // ],
        ),
        body:Column(
          children: [
            Record(),
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