import 'package:flutter/material.dart';
import 'package:performance_test_app/src/lorem_ipsum.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class Task1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      title: 'Task 1',
      color: Colors.blue,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MyLineWidget(index);
        },
      ),
    );
  }
}

class MyLineWidget extends StatelessWidget {
  final int index;

  MyLineWidget(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 42) {
      return _MyLineStack();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: Colors.primaries[index % Colors.primaries.length],
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Text(
                  loremIpsum[index % loremIpsum.length],
                  style: Theme.of(context).textTheme.subtitle1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyLineStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (int i = 0; i < 100; i++) MyLineWidget(-1),
      ],
    );
  }
}
