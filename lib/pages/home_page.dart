import 'package:flutter/material.dart';
import 'package:risin/widgets/alarm_time.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:risin/system/alarms.dart';

class HomePage extends StatefulWidget {
	
	@override
	State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: ListView(
					children: [
						Padding(
						padding: EdgeInsets.all(4.0),
						child: Card(
						child: Column(
							children: [
							Text("Next alarm at:"),
							Row(
								crossAxisAlignment: CrossAxisAlignment.center,
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text("06", style: TextStyle(fontSize: 72.0)),
									Padding(
										padding: EdgeInsets.symmetric(horizontal: 32.0),
										child: Text(":", style: TextStyle(fontSize: 72.0)),
									),
									Text("30", style: TextStyle(fontSize: 72.0)),
									]),
							Text("All alarms:"),
						]))),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					AlarmInfo(),
					]
				)
			)
		);
	}
}
