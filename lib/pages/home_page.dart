import 'package:flutter/material.dart';
import 'package:risin/widgets/alarm_time.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:risin/system/alarms.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
	
	@override
	State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

	@override
	Widget build(BuildContext context) {
		return FutureBuilder(
		future: get_alarms(),
		builder: (BuildContext context, AsyncSnapshot<List<Alarm>> snapshot) {
		print(snapshot.hasData);
		if (!snapshot.hasData) {
			return Scaffold(
			body: Center(
				child: SizedBox(
					width: 200,
					height: 200,
					child: CircularProgressIndicator()
			)));
		} else {
		var alarms = snapshot.data!;
		alarms.sort((a, b) => a.at.compareTo(b.at));
		var alarms_w = alarms.map((a) => AlarmInfo(name: a.name, at: a.at, meanness: a.prev_meanness)).toList();
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
									Text(alarms.length > 0 ? alarms[0].at.hour.toString() : "  ", style: TextStyle(fontSize: 72.0)),
									Padding(
										padding: EdgeInsets.symmetric(horizontal: 32.0),
										child: Text(":", style: TextStyle(fontSize: 72.0)),
									),
									Text(alarms.length > 0 ? alarms[0].at.minute.toString() : " ", style: TextStyle(fontSize: 72.0)),
									]),
							Text("All alarms:"),
							TextButton(
								child: Text("Add an alarm"),
								onPressed: () {
									Navigator.push(context, MaterialPageRoute(builder: (context) => AddAlarm()));
								})
						]+alarms_w + [
							Card(
								child: TextButton(
									child: Text("RESET"),
									onPressed: () async {
										var a = await get_alarms();
										for (var x in a) {
											await delete_alarm(x.name);
										}
										String filePath =
							        (await getApplicationDocumentsDirectory()).path + "/used";
										File f = await (File(filePath).create());
										await f.writeAsString("");
									},
									style: TextButton.styleFrom(
										foregroundColor: Colors.white,
										backgroundColor: Colors.red,
										)))
						]))),
					]
				)
			)
		);
		}
		});
	}
}
