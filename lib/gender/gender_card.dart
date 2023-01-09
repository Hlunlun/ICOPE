import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../gender/gender_model.dart';
//
// class GenderCard extends StatelessWidget {
//   const GenderCard({
//     @required this.icon,
//     Key? key,
//   }) : super(key: key);
//
//   final icon ;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  InkWell(
//       onTap: (){
//         // Navigator.pushNamed(context, '/age');
//       },
//       child: Card(
//           color: loginBtnColor,
//           child: Container(
//               height: 165,
//               width: 350,
//               child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(icon, size:165, color: Colors.white, ),
//                   ]
//               )
//           )
//       ),
//     );
//   }
// }

class GenderCard extends StatefulWidget {
  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          buildCard(0, GenderModel.genders[0],),
          buildCard(1, GenderModel.genders[1],),
          buildCard(2, GenderModel.genders[2],),
        ],
    );
  }

  Widget buildCard(int index, IconData icon) {

    return  InkWell(
      onTap: () => setState(
            () {
          _selected = index;
        },
      ),
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: loginBtnColor,
              width: 6
            ),
          ),
          color: _selected == index ? loginBtnColor : Colors.white,
          child: Container(
              height: 140,
              width: 350,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size:140,
                      color: _selected == index ? Colors.white : loginBtnColor,
                    ),
                  ]
              )
          )
      ),
    );
  }
}