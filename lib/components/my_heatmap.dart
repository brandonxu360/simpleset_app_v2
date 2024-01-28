import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:simpleset_app_v2/models/workout.dart';
import 'package:simpleset_app_v2/services/database_service.dart';

/*
  Display a heatmap for days a workout was recorded for the previous 69 days
  PARAM :: datasets - give the DateTimes where where at least one workout was recorded in the last 60 days
*/
class MyHeatMap extends StatelessWidget {
  const MyHeatMap({super.key});

  // Convert the Iterable of DateTimes into the compatible format for the heatmap datasets
  Map<DateTime, int> datetimeToDataset(Iterable<DateTime> dateTimes) {
    return {for (var dateTime in dateTimes) dateTime: 1};
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseService databaseService = DatabaseService();
    // Days where a workout was recorded
    List<DateTime> dateTimes = [];

    return StreamBuilder<List<Workout>>(
        stream: databaseService.watchWorkoutsInDateTimeRange(
            DateTime.now().subtract(const Duration(days: 69)), DateTime.now()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          dateTimes =
              snapshot.data?.map((workout) => workout.dateTime).toList() ?? [];

          return HeatMap(
            datasets: datetimeToDataset(dateTimes),
            colorMode: ColorMode.color,
            defaultColor: Colors.grey[200],
            showColorTip: false,
            showText: false,
            scrollable: true,
            size: 25,
            startDate: DateTime.now().subtract(const Duration(days: 69)),
            endDate: DateTime.now(),
            colorsets: const {
              1: Color.fromARGB(140, 2, 179, 8),
            },
            onClick: (value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.toString())));
            },
          );
        });
  }
}
