import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class BluePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.blue,
      child: ListView(
        children: [
          for (var i = 0; i < 1000; i++) _buildLineWidget(i),
        ],
      ),
    );
  }

  Widget _buildLineWidget(int i) {
    var line = loremIpsum[i % loremIpsum.length];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  line.substring(0, 1),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(line, softWrap: false),
          )
        ],
      ),
    );
  }
}
