import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class IndigoPage extends StatefulWidget {
  @override
  _IndigoPageState createState() => _IndigoPageState();
}

class _IndigoPageState extends State<IndigoPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _rotation = _controller
        .drive(CurveTween(curve: Curves.easeOutCubic))
        .drive(Tween(begin: 0, end: 2 * pi));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.indigo,
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () => _controller.forward(from: 0),
            child: Text('ROTATE'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: AnimatedBuilder(
              animation: _rotation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotation.value,
                  child: child,
                );
              },
              child: Stack(
                children: [
                  ListView(
                    itemExtent: 40,
                    children: <Widget>[
                      for (var i = 0; i < 100; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 6),
                          child: Text('Item #$i'),
                        ),
                    ],
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
