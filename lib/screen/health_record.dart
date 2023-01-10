import 'package:icope/gender/gender_model.dart';
import 'package:icope/health_record/basic_info_card.dart';
import 'package:icope/health_record/health_record_card.dart';
import 'package:icope/health_record/health_record_model.dart';
import 'package:icope/main.dart';
import 'package:icope/screen/chart.dart';

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
    // return MyChart();
    return Scaffold(
      // body:
        body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyChart(),

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
            // BasicInfoCard(),

            Card(
              child: Container(
                width:300,
                child: Row(
                  children: [

                    Column(
                      children: [
                        Row(
                          children: [

                            SizedBox(width: 60,),
                            Text('性別 : ',style: TextStyle(color: Colors.black54),),
                            Text(BasicInfoModel.gender,style:TextStyle(color: Colors.black54),),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          children: [

                            SizedBox(width: 60,),
                            Text('年齡 : ',style: TextStyle(color: Colors.black54),),
                            Text(BasicInfoModel.age,style:TextStyle(color: Colors.black54),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 60,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('體重 : ',style: TextStyle(color: Colors.black54),),
                            Text(BasicInfoModel.weight,style:TextStyle(color: Colors.black54),),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            Text('身高 : ',style: TextStyle(color: Colors.black54),),
                            Text(BasicInfoModel.height,style:TextStyle(color: Colors.black54),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


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
            Divider(
              indent : 10,
              endIndent : 10,
            ),

            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(cognitiveColor),
              ),
              onPressed: () async{

              },
              child: const Text('認知功能',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(abilityColor),
              ),
              onPressed: () async{

              },
              child: const Text('行動能力',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(nutritionColor),
              ),
              onPressed: () async{

              },
              child: const Text('營養不良',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(visionColor),
              ),
              onPressed: () async{

              },
              child: const Text('視力',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(moodColor),
              ),
              onPressed: () async{

              },
              child: const Text('情緒',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(listeningColor),
              ),
              onPressed: () async{

              },
              child: const Text('聽力',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),








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