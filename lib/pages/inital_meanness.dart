import 'package:flutter/material.dart';
import 'package:risin/widgets/time_bg.dart';
import 'package:risin/pages/home_page.dart';

class InitialMeannessPage extends StatefulWidget {
	
	@override
	State<InitialMeannessPage> createState() => InitialMeannessState();
}

class InitialMeannessState extends State<InitialMeannessPage> {
	double meannessValue = 0.5;
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
			body: TimeBg(
				child: Center(
					child: Column(
						children: [
							Spacer(),
							Text("Set the initial meanness:",
								style: TextStyle(
									fontSize: 20.0
								)
							),
							Slider(
								value: meannessValue,
								max: 1.0,
								divisions: 10,
								label: texts[meannessValue],
								onChanged: (value) {
									setState(() {
										meannessValue = value;
									});
								}
							),
							TextButton(
								child: Text("Let's go"),
								style: TextButton.styleFrom(
									foregroundColor: Colors.black
								),
								onPressed: () {
									Navigator.push(
									context,
									MaterialPageRoute(builder: (context) => HomePage()));
								}
							),
							Spacer()
						]
					)
				),
			)
		);
	}
}
