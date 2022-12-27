import 'package:flutter/material.dart';

class ListTile_Model{


  final TextEditingController stringController=TextEditingController();

  Widget buildListTile(String string ){

    return ListTile(  /// 記得查ListTile
      leading: Text('血壓'),
      title: TextField(
        cursorColor:Colors.black87,
        style: const TextStyle(color:  Colors.black87),
        controller: stringController,
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
    );
  }
}