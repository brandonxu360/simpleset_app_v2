import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpleset_app_v2/models/workout.dart';

// Provide CRUD operations and additional services for Isar database
class DatabaseService {
  // Instance of Isar
  late final Isar _isar;

  DatabaseService() {
    initDB();
  }

  // Initialize database
  void initDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationCacheDirectory();
      // Create new Isar instance
      _isar = await Isar.open([WorkoutSchema], directory: dir.path);
    }
  }

  // CREATE ::: add new Workout to Workout collection
  Future<void> addWorkout(Workout workout) async {
    await _isar.writeTxn(() async {
      await _isar.workouts.put(workout);
    });
  }
}