import 'package:flutter/material.dart';

/*
  Landing page - top level page with quick access to recent workouts and to create new workouts
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Home Screen')),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // TODO: prompt user to add workout
          }),
    );
  }
}
