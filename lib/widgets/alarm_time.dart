import 'package:flutter/material.dart';
import 'package:risin/backend/alarm.dart';
import 'package:risin/pages/newalarm.dart';

class AlarmInfo extends StatelessWidget {
  final Alarm alarm;
  AlarmInfo({required this.alarm});
  @override
  Widget build(BuildContext context) {
    VerticalDivider div = VerticalDivider(
      width: 20,
      thickness: 3,
      indent: 20,
      endIndent: 0,
      color: Colors.black,
    );
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewAlarmPage(alarm: alarm)),
            );
          },
          child: Card(
              child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: Row(children: [
                    Text(alarm.hour.toString() + ":" + alarm.minute.toString()),
                    Spacer(),
                    div,
                    Spacer(),
                    Text(alarm.name),
                    Spacer(),
                    div,
                    Spacer(),
                    Text(alarm.prev_meanness.toString())
                  ])))),
        ));
  }
}
