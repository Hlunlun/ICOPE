import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final String route;

  @override
  Widget build(BuildContext context) {

    return  InkWell(
        onTap: (){
          Navigator.pushNamed(context, route);
          // print('dddd');
        },
        child: Card(
          color: color,

          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child:Icon(icon, size:50.0, )),
                    Text(title, style: TextStyle(fontSize: 40),),
                  ]
              )
          )
      ),
    );
  }


}
