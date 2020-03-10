import 'package:flutter/material.dart';
import 'package:notidomi/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotiDomi',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(),
    );
  }
}
