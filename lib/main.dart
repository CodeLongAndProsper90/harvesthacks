import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:risin/pages/alarm.dart';
import 'package:risin/pages/analog.dart';
import 'package:risin/pages/qrscanner.dart';
import 'package:risin/system/compute_alarm.dart';
import 'package:risin/pages/initial.dart';
import 'package:risin/pages/home_page.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

Future<bool> isFresh() async {
	String path = (await getApplicationDocumentsDirectory()).path + "/used";
	File f = await (File(path).create());
	String s = await f.readAsString();
	bool b = s == "1";
	if (!b)
		f.writeAsString("1");
	return b;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
				textTheme: const TextTheme(
					displaySmall: TextStyle(
						fontFamily: "Red Hat Text",
					),
					bodyMedium: TextStyle(
						fontFamily: "Red Hat Text"
					),

				)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FutureBuilder(
			future: isFresh(),
			builder: (BuildContext context, AsyncSnapshot<bool> data) {
				if (data.hasData) {
					return Scaffold(
						body: !data.data! ? HomePage() : InitialPage()
					);
				} else {
					return CircularProgressIndicator();
				}
			}
		);

	}
}
