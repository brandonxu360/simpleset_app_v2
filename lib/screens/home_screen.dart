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
      body: ListView(children: [
        const SizedBox(height: 20),
        MyHeatMap(dateTimes: {DateTime(2024, 1, 1), DateTime(2024, 1, 7)})
      ]),

      // Navigate to new workout screen - landing page for starting new workouts
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewWorkoutScreen()));
          }),
    );
  }
}
