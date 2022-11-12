import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Alarm {
	final DateTime at;
	final bool repeat_weekly;
	final int time_to_wake;
	final int last_timezone;

	Alarm({required this.at, required this.repeat_weekly, required this.time_to_wake, required this.last_timezone});

	Map<String, dynamic> toJson() {
		return {
			"at": at.toIso8601String(),
			"repeat": repeat_weekly,
			"time_to_wake": time_to_wake,
			"last_timezone": last_timezone
		};
	}
	Alarm fromJson(Map<String, dynamic> j) {
		return Alarm(
			at: DateTime.parse(j["at"]),
			repeat_weekly: j["repeat"],
			time_to_wake: j["time_to_wake"],
			last_timezone: j["last_timezone"]
		);
	}
}

Future<void> add_alarm(Alarm a) async {
	var alarms = await get_alarms();
	alarms += [a];
	await save_alarms(alarms);
}

Future<void> save_alarms(List<dynamic> alarms) async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	f.writeAsString(json.encode(alarms));
}

Future<List<dynamic>> get_alarms() async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	String data_s = await f.readAsString();
	List<dynamic> data = json.decode(data_s);
	return data;
}

