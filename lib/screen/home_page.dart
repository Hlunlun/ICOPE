
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import '../item/item_model.dart';
import '../item/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key
  }) : super(key: key);

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
      drawer: UserDrawer(),
      appBar: AppBar(

        title: const Text('ICOPE',style: TextStyle(
          color: Colors.grey,
          fontSize: 40,
          fontWeight:FontWeight.w900,
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
                Text('每日記錄',style: TextStyle(color: Colors.white),),
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

        ],
      )
    );

  }


}