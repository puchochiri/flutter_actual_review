import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/const/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../const/colors.dart';
import '../const/colors.dart';

Container signInSignUpButton(
BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? (AppLocalizations.of(context).userLoginViewLogin) : 'SIGN UP',
        style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
        }
        return PRIMARY_COLOR;
      }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
    ),
  );
}