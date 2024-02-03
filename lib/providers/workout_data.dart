import 'package:flutter/material.dart';

/*
  Provider for a single recorded workout's data
  - Used to stage a workout's data ephemerally so that changes are not saved until the user specifically presses a save button
  - Created upon opening a NewWorkoutScreen

*/
class WorkoutData extends ChangeNotifier {
  // Name attribute
  String _workoutName = 'Default Name';
  String get workoutName => _workoutName;

  // Date attribute - set to the time of the provider instantiation as default
  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;

  void setName(String name) {
    _workoutName = name;

    notifyListeners();
  }

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;

    notifyListeners();
  }

  // Reset data
  void clearData() {
    _workoutName = '';
  }
}
