import 'package:isar/isar.dart';

part 'workout.g.dart';

@collection
class Workout {
  // Isar id
  Id id = Isar.autoIncrement;

  // Name of workout
  String name;

  // Date that workout is started
  @Index()
  DateTime dateTime;

  Workout({required this.name, required this.dateTime});
}
