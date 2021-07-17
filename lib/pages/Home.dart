import 'package:flutter/material.dart';
import 'package:imkiran_me/pages/mobile/MobileHome.dart';
import 'package:imkiran_me/pages/web/WebHome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return WebHome();
      }
      return MobileHome();
    });
  }
}
