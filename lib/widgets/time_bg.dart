import 'package:flutter/material.dart';

class TimeBg extends StatefulWidget {
	final Widget child;
	TimeBg({required this.child});

	@override
	State<TimeBg> createState() => TimeBgState();
}

class TimeBgState extends State<TimeBg> {

	Widget build(BuildContext context) {
    var morning_grad = [Colors.cyan.shade100, Colors.yellow.shade100];

    var afternoon_grad = [
      Color(0xFF56CCF2),
      Color(0xFF2F80ED),
    ];

    var evening_grad = [
      Color(0xFFFA8072),
      Colors.yellow.shade100,
    ];

    var night_grad = [Color(0xFF01426D), Color(0xFF01162E)];

		final List<Color> chosen;
		DateTime n = DateTime.now();
		if (n.hour >= 17)
			chosen = evening_grad;
		else if (n.hour >= 19)
			chosen = night_grad;
		else if (n.hour >= 12)
			chosen = afternoon_grad;
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
