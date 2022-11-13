import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:g_json/g_json.dart';

T? cast<T>(x) => x is T ? x : null;

class Alarm {
	TimeOfDay at;
	bool repeat_weekly;
	int time_to_wake;
	int last_timezone;
	double prev_meanness;
	String name;

	Alarm({required this.at, required this.repeat_weekly, required this.time_to_wake, required this.last_timezone, required this.name, required this.prev_meanness});

	Map<String, dynamic> toJson() {
		DateTime d = DateTime(1969, 1, 1, at.hour, at.minute);
		return {
			"at": d.toString(),
			"repeat": repeat_weekly,
			"time_to_wake": time_to_wake,
			"last_timezone": last_timezone,
			"prev_meanness": prev_meanness,
			"name": name
		};
	}
	Alarm.fromJson(Map<String, JSON> j) : 
			at = TimeOfDay.fromDateTime(DateTime.parse(j!["at"]!.stringValue))!,
			repeat_weekly = j!["repeat"]!.booleanValue,
			time_to_wake = j!["time_to_wake"]!.integerValue,
			last_timezone = j!["last_timezone"]!.integerValue,
			prev_meanness = j!["prev_meanness"]!.ddoubleValue,
			name = j!["name"]!.stringValue;
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
	print(data_s);
	List<JSON> data = JSON.parse(data_s).list!;
	List<Alarm> fin = [];
	print("New list made");
	print(data.length);
	for (var j in data) {
		Alarm a = Alarm.fromJson(j.mapValue);
		fin.add(a);
	}
	print("Returning");
	return fin;
}

Future<void> delete_alarm(String name) async {
	var alarms = await get_alarms();
	alarms = alarms.where((a) => a.name!=name).toList();
	await save_alarms(alarms);
}
