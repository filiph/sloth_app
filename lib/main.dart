import 'package:flutter/material.dart';
import 'package:performance_test_app/src/pages/task1.dart';
import 'package:performance_test_app/src/pages/task2.dart';
import 'package:performance_test_app/src/pages/task3.dart';
import 'package:performance_test_app/src/pages/task4.dart';
import 'package:performance_test_app/src/welcome.dart';

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
          _Separator1Page(),
          _Separator2Page(),
          Task1Page(),
          _Separator1Page(),
          _Separator2Page(),
          Task2Page(),
          _Separator1Page(),
          _Separator2Page(),
          Task3Page(),
          _Separator1Page(),
          _Separator2Page(),
          Task4Page(),
        ],
      ),
    );
  }
}

class _Separator1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black12, Colors.grey],
        ),
      ),
    );
  }
}

class _Separator2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blueAccent, Colors.blueGrey],
        ),
      ),
    );
  }
}
