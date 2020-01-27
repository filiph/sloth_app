import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:performance_test_app/src/rounded_card.dart';

class LimePage extends StatelessWidget {
  final ValueNotifier<bool> isRunning = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MyRoundedCard(
      color: Colors.lime,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: () => isRunning.value = true,
                  child: Text('START'),
                ),
                MaterialButton(
                  onPressed: () => isRunning.value = false,
                  child: Text('STOP'),
                ),
              ],
            ),
            SizedBox(height: 50),
            Expanded(child: LogViewer(isRunning)),
          ],
        ),
      ),
    );
  }
}

class LogViewer extends StatefulWidget {
  final ValueNotifier<bool> isRunning;

  LogViewer(this.isRunning, {Key key}) : super(key: key);

  @override
  _LogViewerState createState() => _LogViewerState();
}

class _LogViewerState extends State<LogViewer> {
  _Logging logging;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 20,
      itemCount: logging?.logs?.length ?? 0,
      itemBuilder: (context, index) => Text(
        logging.logs[index],
        key: ValueKey(logging.logs[index]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.isRunning.addListener(_handleRunningChange);
  }

  @override
  void didUpdateWidget(LogViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.isRunning.removeListener(_handleRunningChange);
    widget.isRunning.addListener(_handleRunningChange);
  }

  @override
  void dispose() {
    widget.isRunning.removeListener(_handleRunningChange);
    logging?.dispose();
    super.dispose();
  }

  void _handleRunningChange() {
    if (widget.isRunning.value) {
      // Starting anew.
      logging?.dispose();
      logging = _Logging(_update);
    } else {
      // Stopping.
      logging?.model?.stop();
    }
  }

  void _update() {
    if (!mounted) return;
    setState(() {});
  }
}

/// A logging system from hell.
class _Logging {
  final VoidCallback _updateCallback;

  _TimeModel model;

  final List<String> _logs = [];

  _Logging(this._updateCallback) {
    model = _TimeModel(this)..start();
  }

  List<String> get logs => _logs;

  void add(String entry) {
    final _TimeStamp newTimeStamp = _TimeStamp.record(DateTime.now());

    _logs.add('[${model.log.length}] : [${newTimeStamp.time}] $entry');
    _updateCallback();
  }

  void dispose() {
    model.stop();
  }
}

class _TimeModel {
  _Logging _logging;

  List<_TimeStamp> log = <_TimeStamp>[];

  String _time = '';

  String _date = '';
  String _meridiem = '';
  Timer _clockUpdateTimer;
  DateTime now = DateTime.now();
  _TimeModel(this._logging);

  /// The current date in the ambient format.
  String get date => _date;

  /// The current meridiem in the ambient format.
  String get meridiem => _meridiem;

  String get partOfDay {
    if (now.hour < 5) {
      return 'night';
    }
    if (now.hour < 12) {
      return 'morning';
    }
    if (now.hour < 12 + 5) {
      return 'afternoon';
    }
    if (now.hour < 12 + 8) {
      return 'evening';
    }
    return 'night';
  }

  /// The current time in the ambient format.
  String get time => _time;

  /// Start updating.
  void start() {
    log.add(_TimeStamp());
    _clockUpdateTimer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => _updateLog(),
    );
  }

  /// Stop updating.
  void stop() {
    _clockUpdateTimer?.cancel();
    _clockUpdateTimer = null;
  }

  void _updateLog() {
    now = DateTime.now();
    final _year = now.year;

    /// Due to a bug, need to verify the date has the current year before
    /// returning a date and time.
    if (_year < 2019) {
      return;
    }

    final _TimeStamp newTimeStamp = _TimeStamp.record(now);

    log.add(newTimeStamp);

    _logging.add('idle...');
  }
}

class _TimeStamp {
  String time;

  String date;

  String meridiem;

  static DateFormat currentTime = DateFormat('h:mm:ss', 'en_US');

  static DateFormat currentDate = DateFormat('EEEE, MMM d', 'en_US');

  static DateFormat currentMeridiem = DateFormat('aaa', 'en_US');

  _TimeStamp()
      : time = '',
        date = '',
        meridiem = '';

  _TimeStamp.record(DateTime now) {
    time = currentTime.format(now);
    date = currentDate.format(now);
    meridiem = currentMeridiem.format(now);
  }
}
