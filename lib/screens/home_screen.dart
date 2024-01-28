import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/my_heatmap.dart';
import 'package:simpleset_app_v2/components/recent_workouts_list.dart';
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
          children: const [
            SizedBox(height: 10),
            Center(
              child: Text('S I M P L E S E T',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 20),
            MyHeatMap(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Recent Workouts',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            RecentWorkoutsList()
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
