import 'package:flutter/material.dart';
import 'package:simpleset_app_v2/screens/app_wrapper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: AppWrapper());
  }
}
