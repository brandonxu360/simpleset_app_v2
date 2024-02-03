import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/screens/app_wrapper.dart';
import 'package:simpleset_app_v2/utils/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        home: const AppWrapper());
  }
}
