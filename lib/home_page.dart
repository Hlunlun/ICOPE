
import 'package:flutter/material.dart';
import 'item/item_model.dart';
import 'item/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer('userEmail', context),
      appBar: AppBar(

        title: const Text('ICOPE',style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),),
        backgroundColor: Colors.white12,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black12,
                padding: EdgeInsets.symmetric(horizontal:5, vertical: 10),
                textStyle: TextStyle(
                    fontSize: 20,
              fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.pushNamed(context, '/dailyrecord');
            },
            child:Row(
              children: [
                Text('每日記錄'),
                IconButton(
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/dailyrecord');
                  },
                  icon: const Icon(Icons.pending_actions),
                ),
              ],

            ),
          )


        ],
      ),
      body: Column(
        children: [
          Flexible(

            child:GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 10,
              children: List.generate(ItemModel.items.length, (index) {
                return Center(
                  child: ItemCard(
                    title: ItemModel.items[index].title,
                    icon: ItemModel.items[index].icon,
                    color: ItemModel.items[index].color,
                    route:ItemModel.items[index].route,
                  ),
                );
              }
              )
          ),),


          // SizedBox(height: 20,),
          // SizedBox(
          //   height: 40,
          //   child: Center(child:Text('每天ICOPE，健康有保障', style: TextStyle(fontSize: 30),),),
          // ),

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
                  color: Color(0xff92C7C7)
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
              title: const Text('Record', style: stringStyle,),
              leading: const Icon(Icons.folder),
              onTap: () {
                //Update the state of the app
                //..
                //Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(

              title: const Text('Log out', style: stringStyle,),
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