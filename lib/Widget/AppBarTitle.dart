import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          letterSpacing: 1,
          color: Color(0xffBAD0D0),
        ),
      ),
    );
  }
}
