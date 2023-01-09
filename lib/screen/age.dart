import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:icope/utils/constants.dart';


class Age extends StatefulWidget {

  const Age({Key?key}):super(key: key);


  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Column(
          children: [
            const SizedBox(height: 100,),
            const Text('請選擇生日日期', style: TextStyle(color: loginBtnColor,fontSize: 40,fontWeight: FontWeight.w900),),
            const SizedBox(height: 100,),
            Container(
              child: DatePickerWidget(
                locale: DateTimePickerLocale.jp,
                lastDate: DateTime.now(),
                onChange: (DateTime newDate, _) {
                  setState(() {
                    var dob = newDate.toString();
                    print(dob);
                  });
                },

                pickerTheme: const DateTimePickerTheme(
                  backgroundColor: Color(0x869c796e),
                  dividerColor: Colors.transparent,
                  pickerHeight: 200,
                  itemHeight: 110,
                  itemTextStyle: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80,),
            ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                  backgroundColor: MaterialStateProperty.all(loginBtnColor),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/health_record');
                },
                child: const Text('確認',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 25
                ),),
            )
          ],
        )
      );
    }
}