import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:risin/system/alarms.dart';

class NewAlarmPage extends StatefulWidget {
  late final Alarm alarm;

  NewAlarmPage({super.key, Alarm? alarm}) {
    if (alarm == null) {
      this.alarm = Alarm(
          at: DateTime.now(),
          name: "New Alarm",
          time_to_wake: -1,
          last_timezone: DateTime.now().timeZoneOffset.inHours,
          prev_meanness: 0.5,
          repeat_weekly: false);
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
    return Scaffold(
        body: Center(
            child: Column(
              // padding: const EdgeInsets.all(12),
              
      children: [
        GestureDetector(
          onTap: () async {
            widget.alarm.at = await showTimePicker(
              initialTime: TimeOfDay.fromDateTime(widget.alarm.at),
              context: context
            );
          },
          child: Container(
            child: Text("${widget.alarm.at.hour}:${widget.alarm.at.minute}", style: const TextStyle(fontSize: 106)), 
          )
        ),
        Slider(
          value: widget.alarm.prev_meanness,
          max: 1.0,
          divisions: 10,
          label: texts[widget.alarm.prev_meanness],
          onChanged: (value) {
            setState(() {
              widget.alarm.prev_meanness = value;
            });
      ],
    )));
  }
}