import 'package:flutter/material.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class PinkPage extends StatefulWidget {
  @override
  _PinkPageState createState() => _PinkPageState();
}

class _PinkPageState extends State<PinkPage> {
  BigInt _result = BigInt.zero;

  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.pink,
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: _startComputation,
            child: Text('COMPUTE', style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((_) => Colors.pink)),
          ),
          SizedBox(height: 100),
          Text('Result'),
          SizedBox(height: 20),
          _result == null
              ? CircularProgressIndicator()
              : Text(
                  _result.toString(),
                  style: TextStyle(fontSize: 40),
                ),
        ],
      ),
    );
  }

  Future<void> _startComputation() async {
    setState(() {
      _result = null;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    var result = _fibonacci(BigInt.from(32));
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _result = result;
    });
  }
}

BigInt _fibonacci(BigInt n) {
  if (n <= BigInt.from(2)) return BigInt.one;
  return _fibonacci(n - BigInt.one) + _fibonacci(n - BigInt.two);
}
