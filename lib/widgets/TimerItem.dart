import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimerItem extends StatelessWidget {
  final Duration recordedDuration;

  TimerItem(this.recordedDuration);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(recordedDuration.toString())
//        Text(recordedDuration.inHours.toString().padLeft(2,'0')),
//        Text(":"),
//        Text((recordedDuration.inMinutes % 60).toString().padLeft(2,'0')),
//        Text(":"),
//        Text((recordedDuration.inSeconds % 60).toString().padLeft(2,'0')),
//        Text("."),
//        Text((recordedDuration.inSeconds.toDouble() % 1000.0).toString().padLeft(3,'0')),
      ],
    );
  }
}