import 'package:icope/gender/gender_model.dart';
import 'package:icope/health_record/basic_info_card.dart';
import 'package:icope/health_record/health_record_card.dart';
import 'package:icope/health_record/health_record_model.dart';
import 'package:icope/main.dart';

import '../health_record/basic_info_model.dart';

import '../health_record/health_record_class.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';

final TextEditingController timesController=TextEditingController();
class HealthRecord extends StatefulWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  State<HealthRecord> createState() => _HealthRecord();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);



class _HealthRecord extends State<HealthRecord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.person,size: 50,color: Color(0xff4e4a4b),),
                SizedBox(width: 10,),
                Text(MyApp.username,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Color(0xff4e4a4b),),)
              ],
            ),
            Divider(
                indent : 10,
                endIndent : 10,
            ),
            SizedBox(width: 10,),
            BasicInfoCard(),
            Divider(
              indent : 10,
              endIndent : 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 250, 0),
              child: Text('總覽',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600,color: Color(0xff4e4a4b),),),
            ),


            Row(
              children: [
                Expanded(child: HealthRecordCard(
                  title: HealthRecordModel.items[0].title,
                  icon: HealthRecordModel.items[0].icon,
                  value:HealthRecordModel.items[0].value,
                ),),

                Expanded(child: HealthRecordCard(
                  title: HealthRecordModel.items[1].title,
                  icon: HealthRecordModel.items[1].icon,
                  value:HealthRecordModel.items[1].value,
                ),),
              ],
            ),







            // FutureBuilder(
            //   future: RestaurantModel.getRestaurants(selectedCategory),
            //   builder: (context, snapshot){
            //     if(snapshot.hasData){
            //       final restaurants = snapshot.data as List<Restaurant>;
            //       return Expanded(
            //           child: ListView.builder(
            //               itemCount: restaurants.length ,
            //               itemBuilder: (context, index){
            //                 return RestaurantCard(
            //                     image: Image.network(restaurants.elementAt(index).imagePath),
            //                     title: restaurants.elementAt(index).title,
            //                     details: restaurants.elementAt(index).details
            //                 );
            //               }
            //           )
            //       );
            //     }else if(snapshot.hasError){
            //       return Text('${snapshot.error}');
            //     }else{
            //       return const CircularProgressIndicator();
            //     }
            //   },
            // )


          ]
        ),
    ));
  }


}