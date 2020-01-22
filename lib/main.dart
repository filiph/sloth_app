import 'package:flutter/material.dart';
import 'package:performance_test_app/src/black.dart';
import 'package:performance_test_app/src/blue.dart';
import 'package:performance_test_app/src/brown.dart';
import 'package:performance_test_app/src/gray.dart';
import 'package:performance_test_app/src/green.dart';
import 'package:performance_test_app/src/indigo.dart';
import 'package:performance_test_app/src/lime.dart';
import 'package:performance_test_app/src/orange.dart';
import 'package:performance_test_app/src/pink.dart';
import 'package:performance_test_app/src/purple.dart';
import 'package:performance_test_app/src/welcome.dart';
import 'package:performance_test_app/src/yellow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
          GreenPage(),
          LightGrayPage(),
          GrayPage(),
          BluePage(),
          LightGrayPage(),
          GrayPage(),
          YellowPage(),
          LightGrayPage(),
          GrayPage(),
          OrangePage(),
          LightGrayPage(),
          GrayPage(),
          PinkPage(),
          LightGrayPage(),
          GrayPage(),
          BrownPage(),
          LightGrayPage(),
          GrayPage(),
          IndigoPage(),
          LightGrayPage(),
          GrayPage(),
          LimePage(),
          LightGrayPage(),
          GrayPage(),
          BlackPage(),
          LightGrayPage(),
          GrayPage(),
          // Clipping
          PurplePage(),
        ],
      ),
    );
  }
}
