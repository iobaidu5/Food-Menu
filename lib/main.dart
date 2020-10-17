import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final darkTheme = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.orange,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Color(0xff896277),
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
      fontFamily: 'Sogeo',
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Sogeo', fontSize: 42, fontWeight: FontWeight.w600),
          headline2: TextStyle(
              fontFamily: 'Sogeo', fontSize: 28, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(
              fontFamily: "Sogeo", fontSize: 18, fontWeight: FontWeight.w600),
          caption: TextStyle(fontFamily: "Sogeo", fontSize: 14)));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        body: Container(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
