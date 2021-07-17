import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;
  final double letterSpacing;
  final FontWeight fontWeight;

  const CustomText({
    required this.text,
    required this.textSize,
    required this.color,
    required this.letterSpacing,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: textSize,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight),
    );
  }
}
