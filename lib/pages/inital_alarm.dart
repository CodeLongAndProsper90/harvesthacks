import 'package:flutter/material.dart';
import 'package:risin/widgets/time_bg.dart';
import 'package:risin/pages/inital_meanness.dart';

class InitialAlarmPage extends StatefulWidget {
	@override
	State<InitialAlarmPage> createState() => InitalAlarmState();
}

class InitalAlarmState extends State<InitialAlarmPage> {

	Widget build(BuildContext context) {
		return Scaffold(
			body: TimeBg(
				child: Center(
					child: Column(
						children: [
							Spacer(),
							Padding(
								padding: EdgeInsets.all(8.0),
								child: Text("Risin': an alarm that adapts to you",
									style: TextStyle(
										fontSize: 24.0
									)
							)),
							Padding(
								padding: EdgeInsets.symmetric(vertical: 16.0),
								child: TextButton(
									style: TextButton.styleFrom(
										foregroundColor: Colors.purple
									),
									child: Text("Set your first alarm"),
									onPressed: () async {
										var time = await showTimePicker(
											initialTime: TimeOfDay.now(),
											context: context
											);
											Navigator.push(
											context,
											MaterialPageRoute(builder: (context) => InitialMeannessPage()));
									},
								)
							),
							Spacer()
						]
				)
			)
			)
		);
	}
}
