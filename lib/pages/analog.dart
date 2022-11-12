import 'package:flutter/material.dart';

class AnalogClock extends StatelessWidget {
  const AnalogClock({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.centerRight,
      height: MediaQuery.of(context).size.height,
      width: 400,
      child: Column(children: [
        Row(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 100,
                    width: 160.0,
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 160,
                    child: const Text(
                      "2:34\n" "time it goes off",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              )),
        ]),
        CustomPaint(
          painter: OpenPainter(),
        )
      ]),
    ));
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
