import 'package:flutter/material.dart';

class ItemLine extends StatelessWidget {
  final String name;

  ItemLine({@required this.name, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                color:
                    Colors.primaries[name.hashCode % Colors.primaries.length],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _makeSubtitle(name),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static int _fibonacci(int n) {
    if (n <= 1) return n;
    return _fibonacci(n - 1) + _fibonacci(n - 2);
  }

  static String _makeSubtitle(String title) {
    // TODO: Maybe trace this?
    var noPunctuation = title.replaceAll('.', '').replaceAll(',', '');
    var upper = noPunctuation.toUpperCase();
    var reversed = String.fromCharCodes(upper.runes.toList().reversed);
    var appended = '$reversed '
        '(${_fibonacci(reversed.hashCode % 40)}, '
        '${_fibonacci((reversed.hashCode + 1) % 40)})';
    return appended;
  }
}
