import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade500,
        tertiary: Colors.blueGrey.shade900,
        inversePrimary: Colors.grey.shade800,
        outline: Colors.grey.shade400),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[800],
          displayColor: Colors.black,
        ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: const Color.fromRGBO(66, 66, 66, 1),
        secondary: Colors.grey.shade700,
        tertiary: Colors.grey.shade500,
        inversePrimary: Colors.grey.shade300),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[300],
          displayColor: Colors.white,
        ));
