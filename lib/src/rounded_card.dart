import 'package:flutter/material.dart';

class MyRoundedCard extends StatelessWidget {
  final Color color;

  final Widget child;

  final String title;

  MyRoundedCard({
    @required this.child,
    @required this.color,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 60, left: 12, right: 12),
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
          ),
        ],
      ),
    );
  }
}
