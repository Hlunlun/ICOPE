
import 'package:flutter/material.dart';

class DailyRecord extends StatefulWidget {
  const DailyRecord({Key? key}) : super(key: key);

  @override
  State<DailyRecord> createState() => _DailyRecord();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _DailyRecord extends State<DailyRecord> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer('userEmail', context),
        appBar: AppBar(

          title: const Text('每日紀錄',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.grey,
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
        body: buildDailyForm(),
    );

  }

  @override
  Widget buildDailyForm(){

    return ListView(

      //Important :Remove any padding from the ListView
      padding: EdgeInsets.zero,
      children: <Widget>[

        SizedBox(height: 100,),

        ListTile(  /// 記得查ListTile
          leading: Text('血壓'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: emailController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        ListTile(  /// 記得查ListTile
          leading: Text('體重'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: emailController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        ListTile(  /// 記得查ListTile
          leading: Text('身高'),
          title: TextField(
            cursorColor:Colors.black87,
            style: const TextStyle(color:  Colors.black87),
            controller: emailController,
            decoration: const InputDecoration(

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2
                    )
                ),
                contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                // hintText: '血壓',
                hintStyle: TextStyle(color: Colors.grey)

            ),
          ),
        ),
        SizedBox(height: 50,),
        Padding(
            padding: const EdgeInsets.fromLTRB(60,0,60,0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(0,30.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(Colors.black54),
              ),
              onPressed: (){
                ///page through
                Navigator.pushNamed(context, '/main');
              },
              child: const Text('提交',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 20
              ),),
            )),
      ],
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