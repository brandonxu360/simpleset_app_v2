import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/my_heatmap.dart';
import 'package:simpleset_app_v2/screens/new_workout_screen.dart';

/*
  Landing page - top level page with quick access to recent workouts and to create new workouts
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            MyHeatMap(dateTimes: {DateTime(2024, 1, 1), DateTime(2024, 1, 7)}),
            const SizedBox(height: 20),
            const Text(
              'Routines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            )
          ]),

      // Navigate to new workout screen - landing page for starting new workouts
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text(
            'Start Session',
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewWorkoutScreen()));
          }),
    );
  }
}
