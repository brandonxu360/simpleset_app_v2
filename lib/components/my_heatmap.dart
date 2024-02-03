import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

/*
  Display a heatmap for days a workout was recorded for the previous 69 days
  PARAM :: datasets - give the DateTimes where where at least one workout was recorded in the last 60 days
*/
class MyHeatMap extends StatelessWidget {
  final Map<DateTime, int> dateTimes;
  final DateTime startDate;
  final DateTime endDate;

  const MyHeatMap(
      {super.key,
      required this.dateTimes,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: dateTimes,
      colorMode: ColorMode.color,
      defaultColor: Colors.grey[200],
      showColorTip: false,
      showText: false,
      scrollable: true,
      size: 25,
      startDate: startDate,
      endDate: endDate,
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
