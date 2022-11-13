import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Alarm {
	final DateTime at;
	final bool repeat_weekly;
	final int time_to_wake;
	final int last_timezone;

	Alarm({required this.at, required this.repeat_weekly, required this.time_to_wake, required this.last_timezone});

	Map<String, String> toJson() {
		return {
			"at": at.toIso8601String(),
			"repeat": repeat_weekly.toString(),
			"time_to_wake": time_to_wake.toString(),
			"last_timezone": last_timezone.toString()
		};
	}
}

Future<void> save_alarms(List<Alarm> alarms) async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	f.writeAsString(json.encode(alarms));
}

Future<List<Alarm>> get_alarms() async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	String data_s = await f.readAsString();
	List<Map<String, dynamic>> data = json.decode(data_s);
	for (var x in data) {
		print(x);
	}
	return [];
}

