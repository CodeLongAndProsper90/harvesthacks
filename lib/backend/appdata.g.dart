// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData()
  ..lastTimeZone = json['lastTimeZone'] as int
  ..alarms = (json['alarms'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(int.parse(k), Alarm.fromJson(e as Map<String, dynamic>)),
  );

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
      'lastTimeZone': instance.lastTimeZone,
      'alarms':
          instance.alarms.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
