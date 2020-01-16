import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class BrownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.brown,
      child: ListView(
        children: [
          ShadowBonanza(1),
          ShadowBonanza(2),
          ShadowBonanza(3),
          ShadowBonanza(4),
          ShadowBonanza(5),
          ShadowBonanza(6),
          ShadowBonanza(7),
          ShadowBonanza(8),
          ShadowBonanza(9),
          ShadowBonanza(10),
          ShadowBonanza(11),
          ShadowBonanza(12),
        ],
      ),
    );
  }
}

class ShadowBonanza extends StatelessWidget {
  final int index;

  ShadowBonanza(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var line = loremIpsum[index % loremIpsum.length];
    var color1 = Colors.primaries[index % Colors.primaries.length];
    var color2 = Colors.primaries[(index + 10) % Colors.primaries.length];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      child: Row(
        children: <Widget>[
          Material(
            elevation: 12,
            color: color1,
            shadowColor: color1,
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
            child: Text(
              line,
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: color1,
                    offset: const Offset(3, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              softWrap: false,
            ),
          ),
          SizedBox(width: 10),
          Material(
            elevation: 12,
            color: color2,
            shadowColor: color2,
            type: MaterialType.circle,
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
        ],
      ),
    );
  }
}
