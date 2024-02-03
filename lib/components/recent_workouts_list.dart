import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/workout_tile.dart';
import 'package:simpleset_app_v2/models/workout.dart';
import 'package:simpleset_app_v2/utils/helper.dart';

class RecentWorkoutsList extends StatelessWidget {
  final List<Workout> workoutList;

  const RecentWorkoutsList({super.key, required this.workoutList});

  @override
  Widget build(BuildContext context) {
    if (workoutList.isEmpty) {

      // Show a placeholder when there are no workouts
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text('No recent workouts...maybe today?'),
        ),
      );
    }

    // Build the list of workouts
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workoutList.length,
      itemBuilder: (context, index) => WorkoutTile(
        workoutName: workoutList[index].name,
        date: dateTimeToString(workoutList[index].dateTime),
      ),
    );
  }
}
