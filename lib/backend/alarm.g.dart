// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) => Alarm()
  ..id = json['id'] as int
  ..hour = json['hour'] as int
  ..minute = json['minute'] as int
  ..repeat_days = (json['repeat_days'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$WeekDaysEnumMap, e))
      .toSet()
  ..time_to_wake = json['time_to_wake'] as int
  ..prev_meanness = (json['prev_meanness'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$AlarmToJson(Alarm instance) => <String, dynamic>{
      'id': instance.id,
      'hour': instance.hour,
      'minute': instance.minute,
      'repeat_days':
          instance.repeat_days?.map((e) => _$WeekDaysEnumMap[e]!).toList(),
      'time_to_wake': instance.time_to_wake,
      'prev_meanness': instance.prev_meanness,
      'name': instance.name,
    };

const _$WeekDaysEnumMap = {
  WeekDays.monday: 'monday',
  WeekDays.tuesday: 'tuesday',
  WeekDays.wednesday: 'wednesday',
  WeekDays.thursday: 'thursday',
  WeekDays.friday: 'friday',
  WeekDays.saturday: 'saturday',
  WeekDays.sunday: 'sunday',
};
