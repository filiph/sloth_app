import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';

class PurplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Padding(
        padding: EdgeInsets.only(top: 180, left: 12, right: 12),
        child: PhysicalShape(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          elevation: 18,
          child: ListView(
            children: [
              for (var line in loremIpsum) Text(line),
            ],
          ),
        ),
      ),
    );
  }
}
