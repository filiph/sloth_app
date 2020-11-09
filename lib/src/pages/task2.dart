import 'package:flutter/material.dart';
import 'package:performance_test_app/src/item_line.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class Task2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      title: 'Task 2',
      color: Colors.lightGreen,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ItemLine(name: loremIpsum[index % loremIpsum.length]);
        },
      ),
    );
  }
}
