import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/components/my_back_button.dart';
import 'package:simpleset_app_v2/components/my_extended_button.dart';

/*
  Landing page for creating new workouts
  Collect the workout name and date and proceed to start the workout
*/
// ignore: must_be_immutable
class NewWorkoutScreen extends StatelessWidget {
  TextEditingController workoutName = TextEditingController();

  NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Required false to avoid strange behavior when pushing screen up when keyboard pops up (works with bottom padding)
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyBackButton(onTap: () {
                    Navigator.pop(context);
                  }),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "Let's get started!",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50),
              const Image(
                image: AssetImage('lib/assets/images/weight_room.png'),
                width: 260,
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 5),
                      child: Text('Workout Name')),
                  TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 80),
                  MyExtendedButton(
                      label: 'Start Workout',
                      icon: const Icon(Icons.arrow_forward_ios),
                      onTap: () {}),
                  Padding(
                      // Push bottom of screen to allow user to see forms/buttons at bottom automatically when keyboard raises
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
