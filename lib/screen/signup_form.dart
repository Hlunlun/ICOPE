import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:icope/main.dart';
import 'package:icope/user/user_api.dart';
import '../utils/constants.dart';
import '../utils/alert_dialog.dart';

// Create a Form widget.
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignupFormState extends State<SignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

    // listen to input text
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController=TextEditingController();
  final TextEditingController pwdController=TextEditingController();
  final TextEditingController pwdConfirmController = TextEditingController();

  final Telephony telephony = Telephony.instance;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入姓名';
                }
                return null;
              },
              style: TextStyle(
                  fontSize: 30,
                  height: 30/30
              ),
              cursorColor: cursorColor,
              cursorWidth: 3,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              // cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent), ),
                hintText:"姓名",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.person,color: Colors.white,size: 40,),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: idController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入手機號碼';
                }
                return null;
              },
              style: TextStyle(
                  fontSize: 30,
                  height: 30/30
              ),
              cursorColor: cursorColor,
              cursorWidth: 3,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              // cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent), ),
                hintText:"手機號碼",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.phone_android,color: Colors.white,size: 40,),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: pwdController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入密碼';
                }
                return null;
              },
              style: TextStyle(
                  fontSize: 30,
                  height: 30/30
              ),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: cursorColor,
              cursorWidth: 3,
              // cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent), ),
                hintText:"密碼",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.lock,color: Colors.white,size: 40,),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請再次確認密碼';
                }
                return null;
              },
              controller: pwdConfirmController,
              style: TextStyle(
                  fontSize: 30,
                  height: 30/30
              ),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: cursorColor,
              cursorWidth: 3,
              // cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent), ),
                hintText:"再確認一次密碼",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.lock,color: Colors.white,size: 40,),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child : TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(loginBtnColor),
              ),
              onPressed: () async{
                if (_formKey.currentState!.validate()) {
                  bool success = await UserApi.addNewUser(nameController.text, idController.text, pwdController.text);
                  if(success){
                    nameController.text = "";
                    idController.text = "";
                    pwdController.text = "";
                    pwdConfirmController.text = "";
                    Navigator.pushNamed(context, '/signin');
                  }else{
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>ShowAlertDialog(title: '登入資料錯誤',message:'此用戶不存在'),
                    );
                  }

                }else{
                  String message = '請確認是否填寫完全部資料';
                  String title = '請填寫完整資料';
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>ShowAlertDialog(title: title, message:message),
                  );

                }
              },
              child: const Text('註冊',style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25
              ),),
            ),
          ),

        ],
      ),
    );
  }}