import 'package:flutter/material.dart';
<<<<<<< HEAD

class Rizen extends StatefulWidget {
  const Rizen({super.key});

  @override
  State<Rizen> createState() => _RizenState();
}

class _RizenState extends State<Rizen> {
=======
import 'package:just_audio/just_audio.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/widgets/logo.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
			body: LayoutBuilder(
			builder: (BuildContext context, BoxConstraints constraints) {
				final Size biggest = constraints.biggest;
				return GestureDetector(
				onTap: () {
					print("Going to move to the next page");
				},
				child: Container(
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.bottomLeft,
						end: Alignment.topRight,
						colors: [
							Colors.cyan.shade100,
							Colors.yellow.shade100
						]
					)
				),
				child: Center(
					child: Column(
						children: [
							Logo(height: 200, width: 200),
							Text(
								"Risin'",
								style: TextStyle(
									fontSize: 36.0
								),
							),
							Text("Press me to start")
							
						]
						)
					)
				));
			}
		));
  }
}
