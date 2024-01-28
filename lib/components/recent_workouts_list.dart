import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/workout_tile.dart';
import 'package:simpleset_app_v2/models/workout.dart';
import 'package:simpleset_app_v2/utils/helper.dart';

class RecentWorkoutsList extends StatelessWidget {
  final workoutList = [
    Workout(name: 'Workout 1', dateTime: DateTime.now()),
    Workout(
        name: 'Workout2',
        dateTime: DateTime.now().add(const Duration(minutes: 5))),
    Workout(
        name: 'Workout2',
        dateTime: DateTime.now().add(const Duration(minutes: 5))),
    Workout(
        name: 'Workout2',
        dateTime: DateTime.now().add(const Duration(minutes: 5))),
    Workout(
        name: 'Workout2',
        dateTime: DateTime.now().add(const Duration(minutes: 5)))
  ];

  RecentWorkoutsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // These shrinkwrap and physics modifiers are nessessary because this ListView is wrapped inside another ListView
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: workoutList.length,
        itemBuilder: (context, index) => WorkoutTile(
              workoutName: workoutList[index].name,
              date: dateTimeToString(workoutList[index].dateTime),
            ));
  }
}
