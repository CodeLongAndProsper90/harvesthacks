import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

T? cast<T>(x) => x is T ? x : null;

class Alarm {
	final DateTime at;
	final bool repeat_weekly;
	final int time_to_wake;
	final int last_timezone;
	final double prev_meanness;
	final String name;

	Alarm({required this.at, required this.repeat_weekly, required this.time_to_wake, required this.last_timezone, required this.name, required this.prev_meanness});

	Map<String, dynamic> toJson() {
		return {
			"at": at.toIso8601String(),
			"repeat": repeat_weekly,
			"time_to_wake": time_to_wake,
			"last_timezone": last_timezone,
			"prev_meanness": prev_meanness,
			"name": name
		};
	}
	Alarm fromJson(Map<String, dynamic> j) {
		return Alarm(
			at: DateTime.parse(j["at"]),
			repeat_weekly: j["repeat"],
			time_to_wake: j["time_to_wake"],
			last_timezone: j["last_timezone"],
			prev_meanness: j["prev_meanness"],
			name: j["name"]
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

Future<void> clear_alarms() async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	f.writeAsString("");
}

Future<List<Alarm>> get_alarms() async {
	String path = (await getApplicationDocumentsDirectory()).path + "/data.json";
	File f = await (File(path).create());
	String data_s = await f.readAsString();
	if (data_s == "")
		return [];
	List<dynamic> data = json.decode(data_s);
	return data.map((a) => cast<Alarm>(a)!).toList();
}

Future<void> delete_alarm(String name) async {
	var alarms = await get_alarms();
	alarms = alarms.where((a) => a.name!=name).toList();
	await save_alarms(alarms);
}
