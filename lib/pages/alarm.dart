import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:analog_clock/analog_clock.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Column(
        children: [
          const Text(
            "Time to wake up!",
            style: TextStyle(fontSize: 40),
          ),
          AnalogClock(
						decoration: BoxDecoration(
							border: Border.all(width: 2.0, color: Colors.black),
							color: Colors.transparent,
							shape: BoxShape.circle),
						showSecondHand: false,
            isLive: false,
            width: 200.0,
						height: 200.0,
            datetime: DateTime.now(),
          ),
          const Expanded(child: SizedBox.shrink()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Stop",
                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 190, 18, 18)),
                  )),
              SizedBox(width: 40),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Snooze",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
