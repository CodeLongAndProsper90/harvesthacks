import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/widgets/logo.dart';

class InitialPage extends StatefulWidget {
  //const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with TickerProviderStateMixin {
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

    Color textcolor = Colors.black;
    List<Color> chosen;
    DateTime n = DateTime.now();

    if (n.hour >= 12) {
      chosen = afternoon_grad;
    } else if (n.hour >= 17 && n.hour <= 19) {
      chosen = evening_grad;
    } else if (n.hour >= 19) {
      chosen = night_grad;
      textcolor = Colors.white;
    } else {
      chosen = morning_grad;
    }

    return Scaffold(body: LayoutBuilder(
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
                      colors: chosen)),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Spacer(),
                    SlideTransition(
                      position: _offsetAnimation,
                      child:
                          Image.asset("images/sun.png", width: 75, height: 75),
                    ),
                    Text(
                      "Risin'",
                      style: TextStyle(fontSize: 36.0, color: textcolor),
                    ),
                    Text("Press me to start"),
                    Spacer(),
                  ]))));
    }));
  }
}
