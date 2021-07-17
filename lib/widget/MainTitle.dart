import 'package:flutter/material.dart';
import 'package:imkiran_me/Widget/CustomText.dart';

class MainTiitle extends StatelessWidget {
  final String number, text;
  MainTiitle({required this.number, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: number,
          textSize: 20.0,
          color: Color.fromRGBO(25, 218, 15, 1),
          letterSpacing: 0.10,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          width: 12.0,
        ),
        CustomText(
          text: text,
          textSize: 26.0,
          color: Color(0xffCCD6F6),
          letterSpacing: 0.10,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          width: 26.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 0.75,
          color: Color(0xff303C55),
        ),
      ],
    );
  }
}
