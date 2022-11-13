import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:risin/backend/alarm.dart';
import 'package:flutter_alarm_background_trigger/flutter_alarm_background_trigger.dart';
import 'package:flutter_alarm_background_trigger/alarm_methods.dart';
import 'package:risin/backend/datamanger.dart';
import 'package:risin/pages/home_page.dart';
import 'package:risin/widgets/time_bg.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/pages/alarm.dart';

Duration sub(TimeOfDay a, TimeOfDay b) {
  assert(a.hour >= b.hour);
  return Duration(hours: a.hour - b.hour, minutes: a.minute - b.minute);
}

class NewAlarmPage extends StatefulWidget {
  late final Alarm alarm;

  NewAlarmPage({super.key, Alarm? alarm}) {
    if (alarm == null) {
      this.alarm = Alarm();
    } else {
      this.alarm = alarm;
    }
  }

  @override
  State<NewAlarmPage> createState() => _NewAlarmPageState();
}

class _NewAlarmPageState extends State<NewAlarmPage> {
  Map<double, String> texts = {
    0: "Darth Vader",
    0.1: "People talking in movie theatres",
    0.2: "Someone chewing your pencil",
    0.3: "A pen without any ink",
    0.4: "Vanilla cake",
    0.5: "True neutral",
    0.6: "Chocolate cake",
    0.7: "A good keyboard",
    0.8: "Junior mints in popcorn",
    0.9: "Having exact change",
    1.0: "Angelic"
  };

  @override
  Widget build(BuildContext context) {
    var alarmPlugin = FlutterAlarmBackgroundTrigger();
    return Scaffold(
        body: TimeBg(
      child: Center(
          child: Column(
        children: [
          GestureDetector(
              onTap: () async {
                var x = await showTimePicker(
                    initialTime: widget.alarm.timeOfDay(), context: context);
                widget.alarm.hour = x!.hour;
                widget.alarm.minute = x.minute;
              },
              child: Container(
                child: Text("${widget.alarm.hour}:${widget.alarm.minute < 10 ? '0' + widget.alarm.minute.toString() : widget.alarm.minute}",
                    style: const TextStyle(fontSize: 106)),
              )),
          Slider(
              value: widget.alarm.prev_meanness,
              max: 1.0,
              divisions: 10,
              label: texts[widget.alarm.prev_meanness],
              onChanged: (value) {
                setState(() {
                  widget.alarm.prev_meanness = value;
                });
              }),
          TextButton(
              onPressed: () async {
							DataManager data = DataManager();
							await data.load();
							data.addAlarm(widget.alarm);
                Timer(
                    sub(
                        TimeOfDay(
                            hour: widget.alarm.hour,
                            minute: widget.alarm.minute),
                        TimeOfDay.now()), () {
									
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlarmPage(
															id: widget.alarm.id,
                              sound: compute(0, widget.alarm.time_to_wake,
                                  widget.alarm.prev_meanness),
                              stopMethod: AlarmStopMethod.button)));
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Add alarm"),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white))
        ],
      )),
    ));
  }
}
