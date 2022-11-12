import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/widgets/logo.dart';

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
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
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
							Text(
								"Risin'",
								style: TextStyle(
									fontSize: 36.0
								),
							),
							Text("Press me to start"),
							SlideTransition(
								position: _offsetAnimation,
								child: const Padding(
									padding: EdgeInsets.all(8.0),
									child: FlutterLogo(size: 150.0),
								),
							)
						]
						)
					)
				));
			}
		));
  }
}
