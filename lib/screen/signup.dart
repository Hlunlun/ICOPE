
import 'package:flutter/material.dart';
import 'signup_form.dart';
import '../utils/constants.dart';


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
          body:CustomScrollView(

              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              slivers:<Widget>[
                SliverAppBar(
                  stretch: true,
                  //onStretchTrigger: (){ },//拉動時觸發的事件
                  expandedHeight:240,

                  ///不知的狀態????
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    centerTitle: true,
                    title: const Text('',style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),),
                    background: Center(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Image.asset('assets/icons/ability.png',height: 60,),
                            top: 100,
                            left: 60,
                          ),
                          Positioned(
                            child: Image.asset('assets/icons/nutrition.png',height: 60,),
                            top: 40,
                            left: 50,
                          ),
                          Positioned(
                            child: Image.asset('assets/icons/vision.png',height: 60,),
                            top: 40.0,
                            right: 70,
                          ),
                          Positioned(
                            child: Image.asset('assets/icons/listening.png',height: 60,),
                            top: 50,
                            left: 300
                          ),
                          Positioned(
                            child: Image.asset('assets/icons/cognitive.png',height: 60,),
                            top: 40,
                            left: 130.0,
                          ),
                          Positioned(
                            child: Image.asset('assets/icons/mood.png',height: 60,),
                            top: 100.0,
                            left: 150.0,
                          ),
                        ],
                      ),
                    ),
                    // background: Container(
                    //   color: Color(0xa3908d8d),
                    //   child:
                    // )
                  ),
                ),
                ///一條一條的 list
                SliverList(
                  delegate:SliverChildListDelegate(
                      <Widget>[
                          SignupForm(),
                      ]
                  ),
                )
              ]
          ),
      );
  }
}