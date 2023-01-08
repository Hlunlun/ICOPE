
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _Signup();
}
class _Signup extends State<Signup> {

  ///監聽從textfield輸入的東西
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  //暫時用不到，這個變數之後可以拿來用在按下 IconButton 時始使用者可以看到輸入了啥密碼
  final bool _isObscure=true;

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
          drawer: UserDrawer(),
          appBar: AppBar(

            title: const Text('註冊帳號',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),),
            backgroundColor:  Color(0xffe8ad4a),
            

            // actions: [
            //   IconButton(
            //     iconSize: 35,
            //     color: Colors.white,
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/favorite');
            //     },
            //     icon: const Icon(Icons.settings),
            //   ),
            // ],
          ),
          body:Column(
            children: [

            ],
          )
      );
  }
}