import 'package:flutter/material.dart';
import 'package:performance_test_app/src/cyan.dart';
import 'package:performance_test_app/src/gray.dart';
import 'package:performance_test_app/src/orange.dart';
import 'package:performance_test_app/src/pink.dart';
import 'package:performance_test_app/src/welcome.dart';
import 'package:performance_test_app/src/yellow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perf Study',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          WelcomePage(),
          LightGrayPage(),
          GrayPage(),
          CyanPage(),
          LightGrayPage(),
          GrayPage(),
          YellowPage(),
          LightGrayPage(),
          GrayPage(),
          PinkPage(),
          LightGrayPage(),
          GrayPage(),
          OrangePage(),
        ],
      ),
    );
  }
}
