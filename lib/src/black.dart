import 'package:flutter/material.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class BlackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.black,
      child: Row(
        children: <Widget>[
          Expanded(
            child: MyPerception('A', Curves.linear),
          ),
          Expanded(
            child: MyPerception('B', Curves.easeOutCubic),
          ),
        ],
      ),
    );
  }
}

class MyPerception extends StatefulWidget {
  final String label;

  final Curve curve;

  MyPerception(this.label, this.curve, {Key key}) : super(key: key);

  @override
  _MyPerceptionState createState() => _MyPerceptionState();
}

class _MyPerceptionState extends State<MyPerception> {
  bool _goingUp = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          onPressed: () => setState(() => _goingUp = !_goingUp),
          child: Text(widget.label),
        ),
        Expanded(
          child: TweenAnimationBuilder(
            tween: AlignmentTween(
              begin: _goingUp ? Alignment.bottomCenter : Alignment.topCenter,
              end: _goingUp ? Alignment.topCenter : Alignment.bottomCenter,
            ),
            duration: const Duration(milliseconds: 300),
            curve: widget.curve,
            builder: (context, alignment, child) {
              return Align(
                alignment: alignment,
                child: child,
              );
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
