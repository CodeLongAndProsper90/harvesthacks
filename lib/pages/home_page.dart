import 'package:flutter/material.dart';
import 'package:risin/backend/alarm.dart';
import 'package:risin/backend/datamanger.dart';
import 'package:risin/widgets/alarm_time.dart';
import 'package:path_provider/path_provider.dart';
import 'package:risin/pages/newalarm.dart';
import 'package:risin/pages/initial.dart';
import 'dart:io';

import 'package:risin/widgets/time_bg.dart';

int compareTimeOfDay(TimeOfDay a, TimeOfDay b) {
  if (a.hour < b.hour) {
    return -1;
  } else if (b.hour > a.hour) {
    return 1;
  } else {
    if (a.minute < b.minute) {
      return -1;
    } else if (b.minute > a.minute) {
      return 1;
    } else {
      return 0;
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var alarms = DataManager().getAlarms();
    alarms.sort((b, a) => compareTimeOfDay(a.timeOfDay(), b.timeOfDay()));
    var alarms_w = alarms
        .map((a) => AlarmInfo(
              alarm: a,
            ))
        .toList();

    Alarm? nextAlarm = alarms.isEmpty ? null : alarms[0];

    return Scaffold(
        body: TimeBg(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child: Column(children: [
					Spacer(),
          const Text("You are waking up at:"),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nextAlarm != null ? nextAlarm.hour.toString() : "  ",
                    style:
                        const TextStyle(fontSize: 72.0, color: Colors.black)),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 72.0, color: Colors.black),
                    )),
                Text(nextAlarm != null ? nextAlarm.minute.toString() : "  ",
                    style:
                        const TextStyle(fontSize: 72.0, color: Colors.black)),
              ]),
          TextButton(
              child: const Text("Add an alarm"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewAlarmPage()));
              }),
          Expanded(child: ListView(children: alarms_w)),
					Spacer(),
          TextButton(
              onPressed: () async {
                DataManager().clearAlarms();
								Navigator.push(context, MaterialPageRoute(builder: (context) => InitialPage()));
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text("RESET"))
        ])),
      ),
    ));
  }
}
