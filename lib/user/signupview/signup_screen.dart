import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/component/custom_text_form_field.dart';
import 'package:flutter_actual_review/common/const/colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _Title(),
            SizedBox(height: 20),
            CustomTextFormField(
                //hintText: '사용자 이름', // TODO 다국어
                labelText: '사용자 이름',
                onChanged: (String value) {},
            ),
            CustomTextFormField(
                labelText: '이메일',     // TODO 다국어
                onChanged: (String value) {},
            ),
            CustomTextFormField(
                labelText: '비밀번호',    // TODO 다국어
                onChanged: (String value) {}
            ),
            CustomTextFormField(
                labelText: '비밀번호 확인',      // TODO 다국어
                onChanged: (String value) {}
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                ),
                child: Text('회원가입')     // TODO 다국어
            ),




          ],

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


