import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/my_heatmap.dart';
import 'package:simpleset_app_v2/components/recent_workouts_list.dart';
import 'package:simpleset_app_v2/models/workout.dart';
import 'package:simpleset_app_v2/screens/new_workout_screen.dart';
import 'package:simpleset_app_v2/services/database_service.dart';

/*
  Landing page - top level page with quick access to recent workouts and to create new workouts
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseService databaseService = DatabaseService();

    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text('S I M P L E S E T',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(height: 20),

            // Heatmap builder
            StreamBuilder<List<Workout>>(
                stream: databaseService.watchWorkoutsInDateTimeRange(
                    DateTime.now().subtract(const Duration(days: 69)),
                    DateTime.now()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  // Get list of DateTimes from snapshot
                  List<DateTime> dateTimes = snapshot.data
                          ?.map((workout) => workout.dateTime)
                          .toList() ??
                      [];

                  // Convert the Iterable of DateTimes into the compatible format for the heatmap datasets
                  Map<DateTime, int> heatMapData = {
                    for (var dateTime in dateTimes) dateTime: 1
                  };

                  return MyHeatMap(
                    dateTimes: heatMapData,
                    startDate:
                        DateTime.now().subtract(const Duration(days: 69)),
                    endDate: DateTime.now(),
                  );
                }),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Recent Workouts',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),

            // List of workouts in the past week
            StreamBuilder<List<Workout>>(
                stream: databaseService.watchWorkoutsInDateTimeRange(
                    DateTime.now().subtract(const Duration(days: 6)),
                    DateTime.now()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  List<Workout> workoutList = snapshot.data ?? [];

                  // Sort the workoutList based on the workout dates (Latest, first; Earliest, last)
                  workoutList.sort((a, b) => b.dateTime.compareTo(a.dateTime));

                  return RecentWorkoutsList(workoutList: workoutList);
                })
          ]),

      // Navigate to new workout screen - landing page for starting new workouts
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text(
            'Start Session',
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewWorkoutScreen()));
          }),
    );
  }
}
