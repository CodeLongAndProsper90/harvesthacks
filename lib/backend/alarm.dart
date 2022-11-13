import 'dart:math';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "alarm.g.dart";

enum WeekDays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

@JsonSerializable(explicitToJson: true)
class Alarm {
  int id;
  int hour;
  int minute;
  Set<WeekDays>? repeat_days;
  int time_to_wake;
  double prev_meanness;
  String name;

  Alarm._constructor(
      {required this.id,
      required this.hour,
      required this.minute,
      this.repeat_days,
      required this.time_to_wake,
      required this.name,
      required this.prev_meanness});

  factory Alarm() {
    return Alarm._constructor(
      id: Random().nextInt(2147483647),
      hour: TimeOfDay.now().hour,
      minute: TimeOfDay.now().minute,
      name: "New Alarm",
      time_to_wake: -1,
      prev_meanness: 0.5,
    );
  }

  TimeOfDay timeOfDay() => TimeOfDay(hour: hour, minute: minute);

  factory Alarm.fromJson(Map<String, dynamic> json) =>
      _$AlarmFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmToJson(this);
}
