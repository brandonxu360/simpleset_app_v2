import 'package:flutter/material.dart';

/* 
  Individual tiles representing a workout session (expected to be displayed in a list)
*/
class WorkoutTile extends StatelessWidget {
  final String workoutName;
  final String date;

  const WorkoutTile({super.key, required this.workoutName, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
        child: InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () {},
          child: Container(
            //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).highlightColor),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                workoutName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 12),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
