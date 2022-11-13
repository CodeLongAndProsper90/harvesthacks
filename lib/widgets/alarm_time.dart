import 'package:flutter/material.dart';
import 'package:risin/system/alarms.dart';

class AlarmInfo extends StatelessWidget {
	final String name;
	final DateTime at;
	final double meanness;
	AlarmInfo({required this.name, required this.at, required this.meanness});
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
		child: Card(
		child: Padding(
			padding: EdgeInsets.all(4.0),
			child: Center(
				child: Row(
					children: [
						Text(at.hour.toString() + ":" + at.minute.toString()),
						Spacer(),
						div,
						Spacer(),
						Text(name),
						Spacer(),
						div,
						Spacer(),
						Text(meanness.toString())
					]
				))
			)
		));
	}
}
