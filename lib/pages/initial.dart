import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/pages/inital_alarm.dart';

class InitialPage extends StatefulWidget {
  //const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -0.5),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

		Color textcolor = Colors.black;
		List<Color> chosen;
		DateTime n = DateTime.now();
		if (n.hour >= 17)
			chosen = evening_grad;
		else if (n.hour >= 19) {
				chosen = night_grad;
				textcolor = Colors.white;
			}
		else
			chosen = morning_grad;

 
    return Scaffold(
			body: LayoutBuilder(
			builder: (BuildContext context, BoxConstraints constraints) {
				final Size biggest = constraints.biggest;
				return GestureDetector(
				onTap: () {
					Navigator.push(
							context,
							MaterialPageRoute(builder: (context) => InitialAlarmPage()),
						);
				},
				child: Container(
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.bottomLeft,
						end: Alignment.topRight,
						colors: chosen
					)
				),
				child: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							Spacer(),
							SlideTransition(
								position: _offsetAnimation,
								child: Image.asset("images/sun.png", width: 75, height: 75),
								),
							Text(
								"Risin'",
								style: TextStyle(
									fontSize: 36.0,
									color: textcolor
								),
							),
							Text("Press me to start"),
							Spacer(),
						]
						)
					)
				));
			}
		));
  }
}
