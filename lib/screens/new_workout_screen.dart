import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleset_app_v2/components/my_back_button.dart';
import 'package:simpleset_app_v2/components/my_extended_button.dart';
import 'package:simpleset_app_v2/providers/workout_data.dart';
import 'package:simpleset_app_v2/screens/workout_screen.dart';

/*
  Landing page for creating new workouts
  Collect the workout name and date and proceed to start the workout
*/

class NewWorkoutScreen extends StatelessWidget {
  const NewWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController workoutNameController = TextEditingController();

    // Create a change notifier provider with the WorkoutDataProvider so that the staged workout data is accessable in this DOM subtree
    return ChangeNotifierProvider<WorkoutData>(
      create: (context) => WorkoutData(),
      // Seperate the context for the Provider
      child: Builder(builder: (context) {
        return Scaffold(
          // Required resizeToAvoidBottomInset: false to avoid strange behavior when pushing screen up when keyboard pops up (works with bottom padding)
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
                  const Image(
                    image: AssetImage('lib/assets/images/dumbell-transp.png'),
                    width: 260,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 30, bottom: 5),
                          child: Text('Workout Name')),
                      TextFormField(
                        controller: workoutNameController,
                        decoration: InputDecoration(
                            hintText: 'My Amazing Workout',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(height: 80),
                      MyExtendedButton(
                          label: 'Start Workout',
                          icon: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Stage the workout name in WorkoutDataProvider
                            Provider.of<WorkoutData>(context, listen: false)
                                .setName(workoutNameController.text);
                            // Capture the current instance of the WorkoutData provider
                            final value = context.read<WorkoutData>();
                            // Navigate to the WorkoutScreen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // Pass the current instance of WorkoutData provider on the next route
                                    builder: (context) =>
                                        ChangeNotifierProvider.value(
                                          value: value,
                                          builder: ((context, child) =>
                                              const WorkoutScreen()),
                                        )));
                          }),
                      Padding(
                          // Push bottom of screen to allow user to see forms/buttons at bottom automatically when keyboard raises
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
