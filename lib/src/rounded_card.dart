import 'package:flutter/material.dart';

class MyRoundedCard extends StatelessWidget {
  final Color color;

  final Widget child;

  MyRoundedCard({@required this.child, @required this.color, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.only(top: 180, left: 12, right: 12),
        child: PhysicalShape(
          color: Colors.white,
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          elevation: 18,
          child: child,
        ),
      ),
    );
  }
}
