import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/component/custom_text_form_field.dart';
import 'package:flutter_actual_review/user/loginview/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    _App(),
  );
}


class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'),
        Locale('ko')
      ],
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),






    );
  }
}
