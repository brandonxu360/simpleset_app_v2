import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app_v2/components/my_back_button.dart';
import 'package:simpleset_app_v2/components/save_button.dart';
import 'package:simpleset_app_v2/providers/workout_data.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WorkoutData>(
        builder: (BuildContext context, WorkoutData value, Widget? child) =>
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyBackButton(onTap: () {
                  // Pop back to top level screens (home screen)
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }),

                const SizedBox(width: 25),
                // Workout name and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.workoutName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 24)),
                    Text(value.dateTime.toString())
                  ],
                ),

                const Spacer(),
                SaveButton(onTap: () {})
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
