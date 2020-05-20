import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:performance_test_app/src/amber.dart';
import 'package:performance_test_app/src/black.dart';
import 'package:performance_test_app/src/blue.dart';
import 'package:performance_test_app/src/brown.dart';
import 'package:performance_test_app/src/cyan.dart';
import 'package:performance_test_app/src/gray.dart';
import 'package:performance_test_app/src/green.dart';
import 'package:performance_test_app/src/indigo.dart';
import 'package:performance_test_app/src/lime.dart';
import 'package:performance_test_app/src/orange.dart';
import 'package:performance_test_app/src/pink.dart';
import 'package:performance_test_app/src/welcome.dart';
import 'package:performance_test_app/src/yellow.dart';

void main() {
  // Just something to have in the networking tab and logging tab.
  HttpClient client = HttpClient();
  Timer.periodic(const Duration(seconds: 10), (_) async {
    const networkLoggerName = 'my_network_log';
    developer.log('Sending request to example.com.', name: networkLoggerName);
    var request = await client.getUrl(
      Uri.parse('http://www.example.com/'),
    );
    var response = await request.close();
    developer.log(
      'Response from example.com received (HTTP ${response.statusCode}).',
      name: networkLoggerName,
      error: '{"contentLength": ${response.contentLength}}',
    );
  });

  Timer.periodic(const Duration(seconds: 9), (_) {
    print('Regular print() message.');
  });

  runApp(MyApp());
}

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
          AmberPage(),
          LightGrayPage(),
          GrayPage(),
          CyanPage(),
          LightGrayPage(),
          GrayPage(),
          YellowPage(),
          LightGrayPage(),
          GrayPage(),
          BluePage(),
          LightGrayPage(),
          GrayPage(),
          LightGrayPage(),
          GrayPage(),
          GreenPage(),
          OrangePage(),
          LightGrayPage(),
          GrayPage(),
          PinkPage(),
          LightGrayPage(),
          GrayPage(),
          BrownPage(),
          // LightGrayPage(),
          // GrayPage(),
          // PurplePage(),
          LightGrayPage(),
          GrayPage(),
          IndigoPage(),
          LightGrayPage(),
          GrayPage(),
          LimePage(),
          LightGrayPage(),
          GrayPage(),
          BlackPage(),
        ],
      ),
    );
  }
}
