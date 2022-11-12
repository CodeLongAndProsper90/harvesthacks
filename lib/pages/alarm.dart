import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:risin/pages/inital.dart';
import 'package:risin/pages/qrscanner.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:material_clock/material_clock.dart' as materialClock;

enum AlarmStopMethod {
  button,
  qrscan
}

class AlarmPage extends StatefulWidget {
  final AlarmStopMethod stopMethod;
  const AlarmPage({Key? key, required this.stopMethod}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool stopUnlocked = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Column(
        children: [
          const Text(
            "Time to wake up!",
            style: TextStyle(fontSize: 40),
          ),
          materialClock.Clock(
            theme: Brightness.light,
            backgroundStyle: PaintingStyle.stroke,
            secondHandColor: Colors.red,
            alignment: Alignment.center,
            live: true,
            size: 200.0,
            time: DateTime.now(),
          ),
          QRScanner(onScanned: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InitialPage()),)
          }),
          const Expanded(child: SizedBox.shrink()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 190, 18, 18)),
                  )),
              SizedBox(width: 40),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Snooze",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
