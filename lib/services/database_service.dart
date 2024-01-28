import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simpleset_app_v2/models/workout.dart';

// Provide CRUD operations and additional services for Isar database
class DatabaseService {
  // Instance of Isar
  Isar? _isar;

  DatabaseService() {
    initDB();
  }

  // Initialize database
  Future<void> initDB() async {
    // Only create a new Isar instance if an instance does not already exist in the current isolate
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationCacheDirectory();
      // Create new Isar instance
      _isar = await Isar.open([WorkoutSchema], directory: dir.path);
    } else {
      // Get current Isar instance if it already exists
      _isar = Isar.getInstance()!;
    }
  }

  // CREATE ::: add new Workout to Workout collection
  Future<void> addWorkout(Workout workout) async {
    await initDB();
    _isar!.writeTxnSync(() {
      _isar!.workouts.putSync(workout);
    });
  }

  // Create a stream for workouts
  Stream<List<Workout>> watchWorkoutsInDateTimeRange(
      DateTime start, DateTime end) async* {
    await initDB();
    yield* _isar!.workouts.where().dateTimeBetween(start, end).watch();
  }
}
