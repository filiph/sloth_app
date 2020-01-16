import 'package:flutter/material.dart';
import 'package:performance_test_app/src/item_line.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class YellowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.yellow,
      child: ListView(
        children: [
          for (var line in loremIpsum) ItemLine(name: line),
        ],
      ),
    );
  }
}
