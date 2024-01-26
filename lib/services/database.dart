import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Provide CRUD operations and additional services for Isar database
class DatabaseService {
  // Instance of Isar
  late final Isar isar;

  // Initialize database
  void initDB() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([], directory: dir.path);
  }
}
