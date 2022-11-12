import 'package:flutter/material.dart';

class TimeBg extends StatefulWidget {
	final Widget child;
	TimeBg({required this.child});

	@override
	State<TimeBg> createState() => TimeBgState();
}

class TimeBgState extends State<TimeBg> {

	Widget build(BuildContext context) {
		var morning_grad = [
			Colors.cyan.shade100,
			Colors.yellow.shade100
		];

		var evening_grad = [
			Colors.deepOrange.shade400,
			Colors.yellow.shade100
		];

		var night_grad = [
			Colors.grey.shade600,
			Colors.indigo.shade900,
			Colors.blue.shade900
		];

		final List<Color> chosen;
		DateTime n = DateTime.now();
		if (n.hour >= 17)
			chosen = evening_grad;
		else if (n.hour >= 19)
			chosen = night_grad;
		else
			chosen = morning_grad;
		return Scaffold(
			body: Container(
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.bottomLeft,
						end: Alignment.topRight,
						colors: chosen
					),),
				child: widget.child
				));
	}
}
