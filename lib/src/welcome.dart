import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFDD29D),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Image.asset(
                'assets/sloth.png',
                width: 436,
                height: 464,
              ),
            ),
            SizedBox(height: 70),
            Text(
              'Sloth App',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
