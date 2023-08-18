import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/component/custom_text_form_field.dart';
import 'package:flutter_actual_review/common/const/colors.dart';
import 'package:flutter_actual_review/common/layout/default_layout.dart';
import 'package:flutter_actual_review/user/signupview/signup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Column(
          children: [
            _Title(),
            _SubTitle(),
            Image.asset(
              'asset/img/misc/logo.png',
              width: MediaQuery.of(context).size.width / 3 * 2,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context).userLoginViewEmail,
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context).userLoginViewPassword,
              onChanged: (String value) {},
              obscureText: true,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                      ),
                      child: Text(
                        AppLocalizations.of(context).userLoginViewLogin, //로그인
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: Text(
                      AppLocalizations.of(context).userLoginViewSignUP, // 회원가입
                    ),
                  ),
                ),
              ],
            ),
            _SocialLogin(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context).userLoginViewTitle);
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context).userLoginViewSubtitle);
  }
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/google-logo-9808.png',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            'asset/logo-facebookpng-32204.png',
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
