import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:risin/pages/initial.dart';
import 'package:risin/pages/qrscanner.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:just_audio/just_audio.dart';

enum AlarmStopMethod {
  button,
  qrscan
}

class AlarmPage extends StatefulWidget {
  final AlarmStopMethod stopMethod;
	final Sound sound;
  const AlarmPage({Key? key, required this.stopMethod, required this.sound}) : super(key: key);

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
		final player = AudioPlayer();

    return FutureBuilder(
		future: player.setUrl("asset:${widget.sound.file}"),
		builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
		player.play();
		return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Column(
        children: [
          const Text(
            "Time to wake up!",
            style: TextStyle(fontSize: 40),
          ),
          AnalogClock(
						decoration: BoxDecoration(
							border: Border.all(width: 2.0, color: Colors.black),
							color: Colors.transparent,
							shape: BoxShape.circle),
						showSecondHand: false,
            isLive: false,
            width: 200.0,
						height: 200.0,
            datetime: DateTime.now(),
          ),
          QRScanner(onScanned: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InitialPage()),)
          }),
          const Expanded(child: SizedBox.shrink()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 190, 18, 18)),
                  ),
									style: ElevatedButton.styleFrom(
										fixedSize: Size(50, 50),
										shape: CircleBorder()
									),
							),
              SizedBox(width: 40),
              ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Snooze",
                    style: TextStyle(fontSize: 20),
                  ),
									style: ElevatedButton.styleFrom(
										fixedSize: Size(50, 50),
										backgroundColor: Colors.orange,
										shape: CircleBorder()
									)
							)
            ],
          )
        ],
      )),
    );
		});
  }
}
