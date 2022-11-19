import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box('cry_tracker_database');

void setLastCry(DateTime time) {
  _myBox.put('last_cry_date', time);
}

int getDaysSinceLastCry() {
  DateTime? lastCriedDate = getDateSinceLastCry();
  int durationSinceLastCry = DateTime.now().difference(lastCriedDate!).inDays;
  return durationSinceLastCry;
}

DateTime? getDateSinceLastCry() {
  DateTime? lastCriedDate = _myBox.get('last_cry_date');
  return lastCriedDate;
}