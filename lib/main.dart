import 'package:flutter/material.dart';
import 'package:imkiran_me/pages/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiran Suvarna',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
