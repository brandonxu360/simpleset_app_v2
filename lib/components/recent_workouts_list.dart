import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/workout_tile.dart';
import 'package:simpleset_app_v2/models/workout.dart';
import 'package:simpleset_app_v2/services/database_service.dart';
import 'package:simpleset_app_v2/utils/helper.dart';

class RecentWorkoutsList extends StatelessWidget {
  const RecentWorkoutsList({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseService databaseService = DatabaseService();
    // Workouts in the last 7 days
    List<Workout> workoutList = [];

    return StreamBuilder<List<Workout>>(
        stream: databaseService.watchWorkoutsInDateTimeRange(
            DateTime.now().subtract(const Duration(days: 6)), DateTime.now()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // If snapshot error, snapshot.data will not be accessed - thus, we can use !
            workoutList = snapshot.data!;
          }
          return ListView.builder(
              // These shrinkwrap and physics modifiers are nessessary because this ListView is wrapped inside another ListView
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workoutList.length,
              itemBuilder: (context, index) => WorkoutTile(
                    workoutName: workoutList[index].name,
                    date: dateTimeToString(workoutList[index].dateTime),
                  ));
        });
  }
}
