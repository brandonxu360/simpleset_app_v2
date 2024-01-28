import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

/*
  Display a heatmap for days a workout was recorded for the previous 55 days
  PARAM :: datasets - give the DateTimes where where at least one workout was recorded in the last 60 days
*/
class MyHeatMap extends StatelessWidget {
  // Days where a workout was recorded
  final Iterable<DateTime> dateTimes;

  const MyHeatMap({super.key, required this.dateTimes});

  // Convert the Iterable of DateTimes into the compatible format for the heatmap datasets
  Map<DateTime, int> datetimeToDataset(Iterable<DateTime> dateTimes) {
    return {for (var dateTime in dateTimes) dateTime: 1};
  }

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: datetimeToDataset(dateTimes),
      colorMode: ColorMode.color,
      defaultColor: Colors.grey[200],
      showColorTip: false,
      showText: false,
      scrollable: true,
      size: 25,
      startDate: DateTime.now().subtract(const Duration(days: 76)),
      endDate: DateTime.now(),
      colorsets: const {
        1: Color.fromARGB(140, 2, 179, 8),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
