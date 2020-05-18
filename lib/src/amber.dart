import 'package:flutter/material.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class AmberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlutterLogo(),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(_flutterBlurb),
            ),
          ],
        ),
      ),
    );
  }
}

const _flutterBlurb = 'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.';
