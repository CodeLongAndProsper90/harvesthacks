import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:risin/backend/alarm.dart';
import 'package:risin/backend/appdata.dart';

class DataManager {
  AppData? _data;

  DataManager._constructor();

  static final DataManager _instance = DataManager._constructor();

  factory DataManager() {
    return _instance;
  }

  Future<File> getFile() async {
    String filePath = "${(await getApplicationDocumentsDirectory()).path}/newdata.json";

    return File(filePath);
  }

  void save() async {
    if (_data == null) return;

    File f = await getFile();

    f.writeAsString(jsonEncode(_data!.toJson()));
  }

  // Returns whether the file already existed
  Future<bool> load() async {
    if (_data != null) return true;

    File f = await getFile();
    
    if (await f.exists()) {
      String contents = await f.readAsString();

      print(contents);

      _data = AppData.fromJson(jsonDecode(contents)!);

      return true;
    } else {
      _data = AppData.defaults();
      return false;
    }
  }

  void addAlarm(Alarm alarm) {
    _data!.alarms.addAll({alarm.id: alarm});

    save();
  }

  void clearAlarms() {
    _data!.alarms.clear();

    save();
  }

  List<Alarm> getAlarms() {
    return [..._data!.alarms.values];
  }

  Alarm? getAlarm(int id) {
    return _data!.alarms[id];
  } 

  void deleteAlarm(int id) {
    _data!.alarms.remove(id);
  }
}
