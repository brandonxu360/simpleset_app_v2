import 'package:isar/isar.dart';

part 'workout.g.dart';

@collection
class Workout {
  // Isar id
  Id id = Isar.autoIncrement;

  String name;

  @Index()
  DateTime dateTime;

  Workout({required this.name, required this.dateTime});
}
