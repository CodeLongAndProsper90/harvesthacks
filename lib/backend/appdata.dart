import 'package:json_annotation/json_annotation.dart';
import 'package:risin/backend/alarm.dart';
import 'dart:convert';

part "appdata.g.dart";

@JsonSerializable(explicitToJson: true)
class AppData {
  late int lastTimeZone;

  late Map<int, Alarm> alarms;

  AppData();

  factory AppData.defaults() {
    return AppData()
      ..alarms = {}
      ..lastTimeZone = DateTime.now().timeZoneOffset.inHours;
  }

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
