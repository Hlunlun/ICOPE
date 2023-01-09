import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    @required this.icon,
    Key? key,
  }) : super(key: key);

  final icon ;

  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/age');
      },
      child: Card(
          color: loginBtnColor,
          child: Container(
              height: 165,
              width: 350,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, size:165, color: Colors.white, ),
                  ]
              )
          )
      ),
    );
  }
}
