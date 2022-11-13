import 'package:flutter/material.dart';

class AlarmInfo extends StatelessWidget {
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
						Text("06:30"),
						Spacer(),
						div,
						Spacer(),
						Text("-2:31"),
						Spacer(),
						div,
						Spacer(),
						Text("0.6")
					]
				))
			)
		));
	}
}
