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

    return StreamBuilder<List<Workout>>(
      stream: databaseService.watchWorkoutsInDateTimeRange(
        DateTime.now().subtract(const Duration(days: 6)),
        DateTime.now(),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        List<Workout> workoutList = snapshot.data ?? [];

        if (workoutList.isEmpty) {
          // Show a placeholder when there are no workouts
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text('No recent workouts...maybe today?'),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: workoutList.length,
          itemBuilder: (context, index) => WorkoutTile(
            workoutName: workoutList[index].name,
            date: dateTimeToString(workoutList[index].dateTime),
          ),
        );
      },
    );
  }
}
