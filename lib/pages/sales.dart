import 'package:flutter/material.dart';
import 'package:risin/pages/Settings.dart';

class AnalogClock extends StatelessWidget {
  final int howmean;
  final DateTime time;
  AnalogClock({super.key, required this.howmean, required this.time});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      alignment: Alignment.centerRight,
      width: 400,
      child: Card(
      child: Column(children: [
        Row(children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children:  [
                    ListTile(
                      leading: const Icon(Icons.time_to_leave),
                      title: Text('Time: ${time}'),
                      subtitle: Text('MeanScale: ${howmean}'),
                    ),
                    ]),
    )
    )
      ]
      )
      ]
      )
      )
      )
      );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xffaa44aa)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(200, 200), 50, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}