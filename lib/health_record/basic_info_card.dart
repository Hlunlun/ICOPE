import 'package:flutter/material.dart';
import 'package:icope/health_record/basic_info_model.dart';
import 'package:icope/main.dart';
import '../utils/constants.dart';
import '../gender/gender_model.dart';

class BasicInfoCard extends StatelessWidget {

  const BasicInfoCard({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(
        //       color: loginBtnColor,
        //       width: 6
        //   ),
        // ),
        // color: _selected == index ? loginBtnColor : Colors.white,
        child: Container(
            color: Colors.transparent,
            height: 120,
            width: 300,
            child:GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 3/1,
                children: List.generate(BasicInfoModel.infos.length, (index) {
                  return ListTile(
                    leading: Text(BasicInfoModel.infos[index].leading,style: TextStyle(color: Colors.black54),),
                    title:Text(BasicInfoModel.infos[index].title,style: TextStyle(color: Colors.black54),),
                  );
                })
            ),
        )
    );
  }
}