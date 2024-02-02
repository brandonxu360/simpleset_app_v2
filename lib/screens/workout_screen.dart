import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app_v2/providers/workout_data.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String workoutName = Provider.of<WorkoutData>(context).workoutName;

    return Scaffold(
      body: Center(child: Text(workoutName)),
    );
  }
}
