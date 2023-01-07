import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

import 'login_form.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _Signin();
}
class _Signin extends State<Signin> {


  //暫時用不到，這個變數之後可以拿來用在按下 IconButton 時始使用者可以看到輸入了啥密碼
  final bool _isObscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfffafafa),

      ///flexible "appbar",  可以直接用  CustomScrollView
      body:  CustomScrollView(

          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
          ),
          slivers:<Widget>[
            SliverAppBar(
              stretch: true,
              //onStretchTrigger: (){ },//拉動時觸發的事件
              expandedHeight:200,

              ///不知的狀態????
              flexibleSpace: FlexibleSpaceBar(
                 stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                  ],
                  centerTitle: true,
                  title: const Text('ICOPE',style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                  ),),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('assets/icons/login.jpg',fit: BoxFit.fill,),
                      //https://inspire.chu-toulouse.fr/wp-content/uploads/2020/04/inspire_hp_visuel_header.jpg

                    ],
                  ),
              ),
            ),
            ///一條一條的 list
            SliverList(
              delegate:SliverChildListDelegate(
                  <Widget>[
                    const SizedBox(height: 60,),
                    LoginForm(),
                    const SizedBox(height: 80,),
                    // ListTile(  /// 記得查ListTile
                    //   leading: const Icon(Icons.phone_android),
                    //   title: TextField(
                    //     cursorColor:Colors.black87,
                    //     style: const TextStyle(color:  Colors.black87),
                    //     controller: emailController,
                    //     decoration: const InputDecoration(
                    //
                    //         focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //                 color: Colors.black87,
                    //                 width: 2
                    //             )
                    //         ),
                    //         contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                    //         hintText: '手機',
                    //         hintStyle: TextStyle(color: Colors.grey)
                    //
                    //     ),
                    //   ),
                    // ),
                    //
                    // const SizedBox(height: 25,),
                    //
                    // ListTile(
                    //   leading: const Icon(Icons.lock),
                    //   title: TextField(
                    //     obscureText: _isObscure,//hide the password
                    //
                    //     cursorColor:Colors.black87,
                    //     style: const TextStyle(color:  Colors.black87,),
                    //     controller: passwordController,
                    //     decoration: const InputDecoration(
                    //         suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(
                    //                 color: Colors.black87,
                    //                 width: 2
                    //             )
                    //         ),
                    //         contentPadding: EdgeInsets.symmetric(vertical:5,horizontal:5),
                    //         hintText: '密碼',
                    //         hintStyle: TextStyle(color: Colors.grey)
                    //     ),
                    //   ),
                    // ),
                    //
                    // const SizedBox(height: 60,),
                    //
                    // Padding(
                    //     padding: const EdgeInsets.fromLTRB(60,0,60,0),
                    //     child: ElevatedButton(
                    //       style: ButtonStyle(
                    //         fixedSize: MaterialStateProperty.all(const Size(0,30.0)),
                    //         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))),
                    //         backgroundColor: MaterialStateProperty.all(Colors.black54),
                    //       ),
                    //       onPressed: (){
                    //         ///page through
                    //         Navigator.pushNamed(context, '/main');
                    //       },
                    //       child: const Text('登入',style: TextStyle(
                    //           fontWeight: FontWeight.w300,
                    //           color: Colors.white,
                    //           fontSize: 25
                    //       ),),
                    //     )),
                    //
                    //
                    // const SizedBox(height: 10,),
                    //
                    // const Text('Login with other account',textAlign:TextAlign.center,style: TextStyle(color: Colors.grey),),
                    //
                    // ///最下面那排使用其他帳號登入
                    // ///要記得  import 'package:sign_button/sign_button.dart'
                    // ///才能用 SignInButton
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     SignInButton.mini(
                    //         buttonType:ButtonType.google,
                    //         onPressed: (){}
                    //     ),
                    //     SignInButton.mini(
                    //         buttonType:ButtonType.facebook,
                    //         btnColor: Colors.white,
                    //         onPressed: (){}
                    //     ),
                    //     SignInButton.mini(
                    //         buttonType:ButtonType.github,
                    //         onPressed: (){}
                    //     ),
                    //
                    //   ],
                    // ),



                  ]
              ),
            )
          ]
      ),

    );
  }
}