import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_actual_review/common/const/colors.dart';

import 'main_calendar.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    required this.label,
    required this.isTime,
    required this.onSaved,
    required this.validator,
    Key? key,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            cursorColor: Colors.grey, //  커서 색상 변경
            // 시간 관련 텍스트 필드가 아니면 한 줄 이상 작성 가능
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            // 시간 이면 숫자 키보드 아니면 일반 키보드 보여주기
            keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
            // 시간 관련 텍스트 필드는 숫자만 입력하도록 제한
            inputFormatters: isTime ? [
              FilteringTextInputFormatter.digitsOnly,
            ] : [],     // 시간 관련 텍스트 필드는 숫자만 입력하도록 제한
              decoration: InputDecoration(
                border: InputBorder.none,     // 테두리 삭제
                filled: true,                 // 배경색을 지정하겠다는 선언
                fillColor: Colors.grey[300],  // 배경색
                suffixText: isTime ? '시' : null,
              ),
          ),
        ),
      ],
    );
  }
}
