import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:risin/pages/initial.dart';
import 'package:risin/pages/qrscanner.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/pages/home_page.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/backend/datamanger.dart';

enum AlarmStopMethod {
  button,
  qrscan
}

class AlarmPage extends StatefulWidget {
  final AlarmStopMethod stopMethod;
	final Sound sound;
	final int id;
  const AlarmPage({Key? key, required this.stopMethod, required this.sound, required this.id}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool stopUnlocked = false;
/*
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
	*/
	int snooze = 10;
	bool red = true;

  @override
  Widget build(BuildContext context) {
		final player = AudioPlayer();
		print(widget.sound.file);

    return FutureBuilder(
		future: Future.wait([player.setUrl("https://ta.rdis.dev/risin/${widget.sound.file}"), player.setLoopMode(LoopMode.one), player.setVolume(2), player.play()]),
		builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
		print("BOOP");
		
		Color color = Colors.red;

		return Scaffold(
		body: AnimatedContainer(
			duration: Duration(seconds: 1),
			color: red ? Colors.red : Colors.yellow,
			curve: Curves.fastOutSlowIn,
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Column(
        children: [
          const Text(
            "Time to wake up!",
            style: TextStyle(fontSize: 40),
          ),
          AnalogClock(
						showSecondHand: false,
						showDigitalClock: false,
            isLive: false,
            width: 200.0,
						height: 200.0,
            datetime: DateTime.now(),
          ),
					/*
          QRScanner(onScanned: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InitialPage()),)
          }),
				  */	
          const Expanded(child: SizedBox.shrink()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              TextButton(
                  onPressed: () async {
										await player.stop();
										print("Clicked");
										Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
									},
                  child: Text(
                    "Stop",
                  ),
									style: TextButton.styleFrom(
										foregroundColor: Colors.white,
										backgroundColor: Colors.red
									),
							),
              SizedBox(width: 40),
              TextButton(
                  onPressed: () async {
										player.stop();
										await Future.delayed(Duration(minutes: snooze));
										snooze = (snooze / 2) as int;
										player.play();
									},
                  child: Text(
                    "Snooze",
                  ),
									style: TextButton.styleFrom(
										foregroundColor: Colors.white,
										backgroundColor: Colors.orange,
									)
							)
            ],
          )
        ],
      )),
    ));
		});
  }
}
