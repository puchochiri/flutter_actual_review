import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/component/custom_button.dart';
import 'package:flutter_actual_review/common/component/custom_text_form_field.dart';
import 'package:flutter_actual_review/common/const/colors.dart';
import 'package:flutter_actual_review/home/homeview/home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordConfirmTextController = TextEditingController();

  String? passwordError;

  void _checkPasswordsMatch() {
    if(_passwordConfirmTextController.text != _passwordTextController.text) {
      setState(() {
        passwordError ="Passwords do not match";
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _Title(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  icon: Icons.person_outline,
                  controller: _userNameController,
                  //hintText: '사용자 이름', // TODO 다국어
                  labelText: '사용자 이름',
                  onChanged: (String value) {},
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  icon: Icons.email_outlined,
                  controller: _emailTextController,
                  labelText: '이메일',     // TODO 다국어
                  onChanged: (String value) {},
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                    icon: Icons.lock_outline,
                    controller: _passwordTextController,
                    labelText: '비밀번호',    // TODO 다국어
                    obscureText: true,
                    onChanged: (String value) {}
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                    icon: Icons.check,
                    obscureText: true,
                    controller:  _passwordConfirmTextController,
                    controllerPassword: _passwordTextController,
                    labelText: '비밀번호 확인',      // TODO 다국어
                    onChanged: (String value) {
                      _checkPasswordsMatch();
                    },
                    errorText: passwordError,
                ),
                SizedBox(height: 20),
                signInSignUpButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text).then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });



                }),

                /* Container(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                            ),
                            child: Text('회원가입')     // TODO 다국어
                        ),
                      ),
                    ],
                  ),
                ),*/




              ],

            ),
          ),
        ),
      ),
    );
  }
}


class _Title extends StatelessWidget {
  const _Title({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PRIMARY_COLOR,
      title: Text('회원가입 페이자'),
    );
  }
}


