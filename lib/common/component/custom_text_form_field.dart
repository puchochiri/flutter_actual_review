import 'package:flutter/material.dart';
import 'package:flutter_actual_review/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  //정의
  final TextEditingController? controller;
  final TextEditingController? controllerPassword;
  final IconData? icon;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool    obscureText;
  final bool    autofocus;
  final ValueChanged<String>? onChanged;



  //생성자
  const CustomTextFormField(
      {
        required this.onChanged,
        this.controllerPassword,
        this.controller,
        this.icon,
        this.labelText,
        this.obscureText = false,
        this.autofocus = false,
        this.hintText,
        this.errorText,
        super.key
      });

  @override
  Widget build(BuildContext context) {
    final baseBorder =OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      )
    );
    return TextFormField(
      controller: controller != null ? controller : null,
      validator: controller == controllerPassword ? ((value) {
        if(value != controllerPassword!.text){
          return 'Passwords do not match';
        }
        return null;
      }
      ) : null,
      cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할떄
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        labelText: labelText,
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false -- 배경색 없음
        // false -- 배경색 있음
        filled: true,
        // 모든 Inpput 상태의 기본 스타일 세팅
        border: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),



    );
  }
}
